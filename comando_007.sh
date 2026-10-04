cd /home/claude/work/wade3; python3 - <<'EOF'
import json,collections
src=json.load(open('out_W18a.json')); ver=json.load(open('ver_W18a.json'))
assert len(src)==len(ver)==21
assert [a['id'] for a in src]==[b['id'] for b in ver]
print(collections.Counter(v['veredicto'] for v in ver))
for v in ver:
    assert set(['id','veredicto','comprobado','problemas','texto_corregido','ancla_ok','ancla_nota','alcance_ok','repite'])<=set(v)
    if v['veredicto']=='corregir':
        o=[s for s in src if s['id']==v['id']][0]['texto']
        t=v['texto_corregido']
        assert t.startswith('⟶ ')
        # mostrar diferencias
        import difflib
        sm=difflib.SequenceMatcher(None,o,t)
        print('==',v['id'])
        for tag,i1,i2,j1,j2 in sm.get_opcodes():
            if tag!='equal': print('   ',tag,'|',o[max(0,i1-30):i2+10].replace('\n',' '),'|→|',t[max(0,j1-30):j2+10])
    if not v['ancla_ok']: print('ANCLA FALSA',v['id'],v['ancla_nota'][-140:])
    if not v['alcance_ok']: print('ALCANCE',v['id'],v.get('alcance_nota','')[:120])
    # citas de más de 25 palabras
    import re
    txt=v['texto_corregido'] or [s for s in src if s['id']==v['id']][0]['texto']
    for q in re.findall('«([^»]*)»',txt):
        if len(q.split())>25: print('CITA LARGA',v['id'],len(q.split()),q[:80])
EOF
ls -la /home/claude/work/wade3/ver_W18a.json