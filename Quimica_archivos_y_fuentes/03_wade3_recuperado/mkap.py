import sys,re,os
sys.path.insert(0,'gen')
from bs4 import BeautifulSoup
import extract_text as X
s=open('step9n_pre.html',encoding='utf8').read()
soup=BeautifulSoup(s,'lxml')
# capa de estudio: fuera lo que sólo se ve en Modo auditoría
n=0
for el in soup.select('.auditOnly'):
    el.decompose(); n+=1
print('auditOnly quitados',n)
secs=[m for m in re.findall(r'<section class="panel section" id="((?:ap-cap|guia-teoria-)[^"]*)"',s)]
tot=0
for sid in secs:
    t=X.extract(soup,sid); open(f'wade3/AP/{sid}.txt','w').write(t); tot+=len(t)
print(len(secs),'secciones',tot)
# ejercicios U2 por tramos y las secciones «más ejercicios resueltos» / guía de las otras unidades
def ej(a,b): return '\n\n'.join(X.extract(soup,f'guia-u2-e{n}') for n in range(a,b+1))
for name,a,b in (('ej_u2_01-16',1,16),('ej_u2_17-35',17,35),('ej_u2_36-44',36,44)):
    t=ej(a,b); open(f'wade3/AP/{name}.txt','w').write(t); print(name,len(t))
for sid in ('ej-u4','ej-u5','ej-u6','ej-u7','guia-u4','guia-u5','guia-u6','guia-u7','ej-u3','guia-u3'):
    t=X.extract(soup,sid); open(f'wade3/AP/{sid}.txt','w').write(t); print(sid,len(t))
