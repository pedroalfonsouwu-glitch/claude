cd /home/claude/work/wade3; python3 - <<'EOF'
import json,glob,collections
for f in sorted(glob.glob('ver_W1*.json'))[:9]:
    d=json.load(open(f))
    c=collections.Counter(x['veredicto'] for x in d)
    print(f,dict(c), 'ancla_false', sum(1 for x in d if not x.get('ancla_ok',True)), 'alc_false', sum(1 for x in d if not x.get('alcance_ok',True)))
d=json.load(open('ver_W15a.json'))
for x in d[:40]:
    if x['veredicto']!='ok':
        print('---',x['id'],x['veredicto']); 
        for p in x['problemas']: print('   *',p[:400])
        if not x.get('ancla_ok',True): print('   ANCLA:',x.get('ancla_nota','')[:300])
EOF