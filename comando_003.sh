cd /home/claude/work/wade3; python3 -c "
import json
for f in ['ver_W15a.json','ver_W13b.json','ver_W11a.json']:
    d=json.load(open(f))
    from collections import Counter
    print(f,Counter(x['veredicto'] for x in d))
    for x in d:
        if x['veredicto']!='ok':
            print('  ',x['id'],x['veredicto'],'|',' // '.join(x['problemas'])[:420])
"