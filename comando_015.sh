ls ver_*.json | wc -l && python3 - <<'E'
import json
for i in ['W13a','W13b','W13c']:
    v=json.load(open(f'ver_{i}.json')); 
    from collections import Counter
    print(i,len(v),Counter(x['veredicto'] for x in v), sum(1 for x in v if not x.get('ancla_ok',True)), sum(1 for x in v if not x.get('alcance_ok',True)))
E
ls -la ver_W13*.json; ls /tmp/claude-0/-home-claude/e0ede9ab-4c8a-58f1-b558-42f4822c9fb2/scratchpad | head -30