date -u; python3 - <<'EOF'
import json,collections
a=json.load(open('sol_all.json'))
print(len(a)); 
for x in a[150:153]+a[300:302]: print(json.dumps(x,ensure_ascii=False)[:600])
print(collections.Counter(bool(x.get('dudas')) for x in a))
print(collections.Counter(x['dudas'][:40] for x in a).most_common(6))
import glob
tot=0
for f in sorted(glob.glob('out_*.json')): tot+=len(json.load(open(f)))
print('hallazgos',tot, 'ver:',sorted(glob.glob('ver_*.json')))
EOF