cd /home/claude/work/wade3; python3 - <<'EOF'
import json
src=json.load(open('out_W18c.json',encoding='utf8'))
ver=json.load(open('ver_W18c.json',encoding='utf8'))
assert [n['id'] for n in src]==[v['id'] for v in ver], 'orden/ids'
keys={'id','veredicto','comprobado','problemas','texto_corregido','ancla_ok','ancla_nota','alcance_ok','repite'}
for v,n in zip(ver,src):
    assert set(v)==keys,(v['id'],set(v)^keys)
    assert v['veredicto'] in ('ok','corregir','descartar')
    if v['veredicto']=='corregir':
        assert v['texto_corregido'] and v['problemas']
        assert v['texto_corregido'].startswith('⟶ ')
    else:
        assert v['texto_corregido']=='' 
    if not v['ancla_ok']: assert v['ancla_nota']
print('OK', len(ver), {k:sum(1 for v in ver if v['veredicto']==k) for k in ('ok','corregir','descartar')})
print('anclas falsas:',[v['id'] for v in ver if not v['ancla_ok']], 'alcance mal:',[v['id'] for v in ver if not v['alcance_ok']])
import difflib
for v,n in zip(ver,src):
    if v['veredicto']=='corregir':
        a=n['texto']; b=v['texto_corregido']
        sm=difflib.SequenceMatcher(None,a,b,autojunk=False)
        print('\n#####',v['id'],len(a),'→',len(b))
        for tag,i1,i2,j1,j2 in sm.get_opcodes():
            if tag!='equal': print('  ',tag,'| −',repr(a[i1:i2][:200]),'| +',repr(b[j1:j2][:400]))
EOF
ls -la /home/claude/work/wade3/ver_W18c.json; ls /home/claude/work/wade3 -la --time-style=+%H:%M | awk '$6>="23:1"' | head -20