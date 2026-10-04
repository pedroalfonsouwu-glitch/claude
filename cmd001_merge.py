import json,glob,os
S='/tmp/claude-0/-home-claude/e0ede9ab-4c8a-58f1-b558-42f4822c9fb2/scratchpad/vW21b/'
src=json.load(open('/home/claude/work/wade3/out_W21b.json',encoding='utf-8'))
order=[n['id'] for n in src]
res={}
for f in sorted(glob.glob(S+'frag/*.json')):
    for o in json.load(open(f,encoding='utf-8')):
        res[o['id']]=o
out=[res[i] for i in order if i in res]
keys=["id","veredicto","comprobado","problemas","texto_corregido","ancla_ok","ancla_nota","alcance_ok","repite"]
for o in out:
    for k in keys:
        assert k in o,(o['id'],k)
    assert o['veredicto'] in('ok','corregir','descartar')
    if o['veredicto']=='corregir': assert o['texto_corregido'].strip()
    else: assert o['texto_corregido']==''
json.dump(out,open('/home/claude/work/wade3/ver_W21b.json','w',encoding='utf-8'),ensure_ascii=False,indent=1)
chk=json.load(open('/home/claude/work/wade3/ver_W21b.json',encoding='utf-8'))
print(len(chk),'guardadas;',[o['id'][-2:]+':'+o['veredicto'] for o in chk])
print('faltan:',[i for i in order if i not in res])
