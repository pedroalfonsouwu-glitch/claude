python3 - <<'EOF'
import json,re
src=json.load(open('out_W21b.json',encoding='utf-8'))
ver=json.load(open('ver_W21b.json',encoding='utf-8'))
assert [n['id'] for n in src]==[v['id'] for v in ver]
for n,v in zip(src,ver):
    t=v['texto_corregido'] or n['texto']
    qs=re.findall(r'«([^»]*)»',t)
    long=[(len(q.split()),q) for q in qs if len(q.split())>25]
    print(n['id'],v['veredicto'],'citas:',len(qs),'largas:',long, '| inicio ok:',t.startswith(('⟶ Del libro (Wade).','⟶ CONFLICTO.','⟶ Confirmación.','⟶ Actualización.')),'| fin:',t[-60:])
    if n['id'] in('W21b-01','W21b-02','W21b-06','W21b-13','W21b-14','W21b-18'):
        for q in qs: print('     «'+q+'»')
EOF