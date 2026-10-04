python3 - <<'EOF'
import json,difflib
src={n['id']:n for n in json.load(open('out_W21b.json',encoding='utf-8'))}
ver=json.load(open('ver_W21b.json',encoding='utf-8'))
print(len(ver), [v['id'] for v in ver]==list(src))
for v in ver:
    if v['veredicto']=='corregir':
        a=src[v['id']]['texto']; b=v['texto_corregido']
        sm=difflib.SequenceMatcher(None,a,b)
        print('==',v['id'],len(a),'→',len(b))
        for tag,i1,i2,j1,j2 in sm.get_opcodes():
            if tag!='equal': print('  ',tag,'| -',repr(a[i1:i2][:300]),'| +',repr(b[j1:j2][:500]))
    if not v['alcance_ok'] or not v['ancla_ok']: print('FLAG',v['id'],v['alcance_ok'],v['ancla_ok'],v['problemas'])
EOF
ls -la /home/claude/work/wade3/ver_W21b.json