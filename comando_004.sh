cd /home/claude/work && ls wade3/ver_*.json 2>/dev/null | head -30; python3 - <<'EOF'
import json,glob
c=0
for f in sorted(glob.glob('/home/claude/work/wade3/ver_*.json')+glob.glob('/home/claude/work/wade2/ver_*.json')):
    try: d=json.load(open(f))
    except Exception as e: print(f,'ERR',e); continue
    for o in d:
        if o.get('ancla_ok') is False:
            c+=1
            if c<=14: print(f.split('/')[-1],o['id'],'|',o.get('ancla_nota','')[:420]); print()
print(c)
EOF