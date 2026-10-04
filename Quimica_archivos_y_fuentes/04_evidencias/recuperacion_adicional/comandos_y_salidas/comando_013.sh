cd /home/claude/work/wade3 && date -u && python3 - <<'E'
import json,os
tr=json.load(open('tramos.json'))
ids=[t['id'] if isinstance(t,dict) else t for t in tr] if isinstance(tr,list) else list(tr)
miss=[]
for i in ids:
    o=json.load(open(f'out_{i}.json'))
    p=f'ver_{i}.json'
    if not os.path.exists(p): miss.append((i,len(o),'no')); continue
    try:
        v=json.load(open(p))
        if len(v)!=len(o): miss.append((i,len(o),f'parcial {len(v)}'))
    except Exception as e: miss.append((i,len(o),'roto'))
print(len(ids),miss, sum(m[1] for m in miss))
E