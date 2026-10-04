cd /home/claude/work/wade3 && python3 - <<'E'
import json,os
tr=json.load(open('tramos.json'))
miss=[]
for t in tr:
    i=t[0]
    o=json.load(open(f'out_{i}.json'))
    p=f'ver_{i}.json'
    if not os.path.exists(p): miss.append((i,len(o),'no',t[2],t[3],t[4],t[5])); continue
    try:
        v=json.load(open(p))
        if len(v)!=len(o): miss.append((i,len(o),f'parcial {len(v)}',t[2],t[3],t[4],t[5]))
    except Exception as e: miss.append((i,len(o),'roto'))
for m in miss: print(m)
print(len(miss), sum(m[1] for m in miss))
E