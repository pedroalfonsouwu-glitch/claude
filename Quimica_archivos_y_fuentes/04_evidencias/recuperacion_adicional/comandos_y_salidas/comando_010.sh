cd /home/claude/work/wade3; python3 - <<'EOF'
import json
ver={v['id']:v for v in json.load(open('ver_W18c.json',encoding='utf8'))}
for i in ['W18c-06','W18c-07']:
    print(i); print(ver[i]['texto_corregido']); print()
EOF