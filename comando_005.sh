cd /tmp/claude-0/-home-claude/e0ede9ab-4c8a-58f1-b558-42f4822c9fb2/scratchpad/vW18c && python3 - <<'EOF'
p='part2.py'; s=open(p,encoding='utf8').read()
old='vale si esa nota se integra (acá queda aprobada con una corrección).'
new='vale si esa nota se integra (acá queda aprobada).'
assert s.count(old)==1; open(p,'w',encoding='utf8').write(s.replace(old,new))
EOF
cat > part3.py <<'EOF'
# -*- coding: utf-8 -*-
add('W18c-16', 'ok', [
 "recuadro «ESTRATEGIAS PARA RESOLVER PROBLEMAS · Propuesta de mecanismos de reacción» → empieza en p. 815 (§ 18.18 «Formación de acetales») y sigue en p. 816: sí; el acetal del ejemplo es un anillo de seis con O y, en el C vecino, H y –OCH₃: sí",
 "p. 816 (ampliada), primera fila: «protonación» (el H⁺ va al O del anillo), «ruptura», «catión estabilizado por resonancia» dibujado como C⁺ y como C=O⁺–CH₃: sí",
 "p. 816: cita «El ataque del agua al catión da lugar a un hemiacetal protonado.»: sí, literal; rótulos «ataque por el agua», «desprotonación» (con H₂O), «hemiacetal»: sí",
 "p. 816: cita «también se puede eliminar el grupo —OCH₃ por protonación y pérdida de metanol»: sí, literal; después «protonación», «intermedio estabilizado por resonancia», «desprotonación» con HOH → aldehído + H₃O⁺ («productos»): sí",
 "Problema 18.32 → p. 816: «El mecanismo también se podría haber realizado protonando primero el átomo de oxígeno del grupo metoxilo, seguido de la ruptura del anillo. Represente este mecanismo alternativo.»: sí",
 "Problema 18.33 → pp. 816–817: (a) formación y (b) hidrólisis del acetal etilénico de la ciclohexanona en p. 816; (c) y (d) en p. 817: sí; 18.32 y 18.33 no figuran en p. A5 (18.31, 18.35…): sí",
 "apunte ap-cap47: la pizarra protona el O glucosídico (el del puente) y dice «el agua ataca más rápido; el otro O sale con el par»: sí, no separa ruptura y ataque",
 "química: catión oxocarbenio estabilizado por el otro O; H⁺ catalizador: correcto",
 "referencia: § 18.18, «Estrategias para resolver problemas», p. 816; Problemas 18.32 y 18.33, pp. 816–817 → sí",
], repite="No repite el apunte actual. Aviso fuera del apunte actual: la nota pendiente W18b-21 (mismo párrafo, pp. 812–815) ya adelanta el matiz «en el libro el grupo protonado sale primero y deja el catión, y recién después entra el agua»; si entran las dos, ésta es la que lo desarrolla y conviene que vaya después.")

add('W18c-17', 'corregir', [
 "ecuación → p. 819 (×2,4): R–CHO + 2 Ag(NH₃)₂⁺ + 3 ⁻OH –(H₂O)→ 2 Ag↓ + R–COO⁻ + 4 NH₃ + 2 H₂O, con rótulos aldehído / reactivo de Tollens / plata / carboxilato: sí, coeficientes 2, 3, 2, 4, 2",
 "la misma ecuación en el Resumen, punto 9, «Ensayo de Tollens» → p. 823: sí",
 "Glosario, Prueba de Tollens: «formado por un complejo de plata y amoniaco [Ag(NH₃)₂⁺ ⁻OH]» → p. 826: sí, literal",
 "cita «formándose una suspensión negra o un espejo de plata en el interior del tubo de ensayo (o del matraz)» → p. 819: sí, literal",
 "foto del balón plateado y nota al margen «El ensayo de Tollens generalmente se realiza a pequeña escala (p. 819), pero puede formarse un espejo de plata incluso en un recipiente grande» → p. 818: sí",
 "apunte ap-cap47 (Pizarrón TP3-2): «Tollens (guía): D-glucosa + 2 Ag⁺ + 3 OH⁻ → gluconato + 2 H₂O + 2 Ag⁰»: sí, la guía escribe eso",
 "cuenta de electrones y de cargas (marcada como adición): +1 → +3, 2 Ag⁺; (+2) + (−3) = −1: correcta",
 "apunte: justo después del ancla ya hay una nota del Wade con la ecuación del Tollens de su cap. 23; comprobada en la imagen de la p. 1074: «2 Ag(NH₃)₂⁺ ⁻OH + ⁻OH → R–COO⁻ + 2 Ag↓ + 4 NH₃ + 2 H₂O»: es la misma ecuación, escrita con los hidróxidos repartidos",
 "referencia: § 18.20, pp. 818–819; Resumen, punto 9, p. 823; Glosario, p. 826 → sí",
], problemas=[
 "Repite la ecuación del Tollens del Wade, que ya está en la nota que sigue al ancla (§ 23.10, pp. 1074–1075), sin decir que es la misma. Las dos notas quedarían pegadas, con la misma ecuación escrita de dos maneras (allá «2 Ag(NH₃)₂⁺ ⁻OH + ⁻OH», acá «2 Ag(NH₃)₂⁺ + 3 ⁻OH»), y el alumno puede creer que son dos ecuaciones. Se agrega una frase que las une. Lo nuevo de esta nota (la comparación número por número con la guía, la cuenta de electrones y cargas, y que el positivo también puede ser una suspensión negra) se conserva.",
], reps=[
 ("(con «H₂O» sobre la flecha: en agua). Compará con la de la guía,",
  "(con «H₂O» sobre la flecha: en agua). Es la misma ecuación de la otra nota del libro de este bloque, la de su capítulo de azúcares; allá los hidróxidos están escritos repartidos (2 Ag(NH₃)₂⁺ ⁻OH + ⁻OH) y acá juntos: son tres en los dos casos. Compará con la de la guía,"),
 ("(Wade, 5.ª ed., § 18.20, pp. 818–819; Resumen, punto 9, p. 823; Glosario, p. 826)",
  "(Wade, 5.ª ed., § 18.20, pp. 818–819; Resumen, punto 9, p. 823; Glosario, p. 826; la misma ecuación en § 23.10, p. 1074)"),
], repite="Repite la ecuación del Tollens del Wade y que cada aldehído reduce dos Ag⁺ a plata metálica: están en la nota existente «El libro escribe la ecuación del Tollens completa» (Wade, § 23.10, pp. 1074–1075), en el mismo lugar. Nuevo: la comparación con la ecuación de la guía, el porqué del 2 y del 3, la suspensión negra, la foto y la pequeña escala.")

add('W18c-18', 'ok', [
 "cita «Los hidrocarburos simples, éteres, cetonas e incluso los alcoholes no reaccionan con el reactivo de Tollens.» → p. 819: sí, literal",
 "Problema 18.44 → p. 827: C₁₀H₁₂O, «reacciona con una solución ácida de 2,4-dinitrofenilhidrazina y se obtiene un derivado cristalino que da negativa la prueba de Tollens»: sí (la frase, tal como está, lo dice del derivado)",
 "Problema 18.46 → p. 828: «da positiva la prueba de la 2,4-dinitrofenilhidrazina y negativa la prueba de Tollens»: sí; sin respuesta en p. A5: sí",
 "Problema 18.47 → p. 828: «Reacciona con hidrocloruro de semicarbazida para formar un derivado cristalino, pero da negativa la prueba de Tollens»: sí",
 "respuestas → p. A5 (×4): «18.44. 1-fenil-2-butanona (bencil etil cetona)»; «18.47. ciclobutanona»: sí, las dos son cetonas",
 "apunte ap-cap47: el párrafo del ancla (enolato; «siempre se oxida el C1, aunque sea fructosa») y las dos notas del Wade que siguen (reordenamiento enodiol): sí; apunte ap-cap43: la nota de Morrison y Boyd dice que «las cetosas se comportan como cualquier α-hidroxicetona»: sí",
 "forma: CONFLICTO con las dos fuentes y clasificación («compatibles»): sí",
 "referencia: § 18.20, p. 819; Problemas 18.44, 18.46 y 18.47, pp. 827–828; p. A5 → sí",
], repite="No repite: las notas existentes explican por qué la cetosa da positivo; ninguna pone al lado la frase del cap. 18 («cetonas… no reaccionan») ni los problemas que usan el Tollens para distinguir aldehído de cetona.")

add('W18c-19', 'ok', [
 "Problema 18.73 → p. 833 (×2,7): A, m/z 116 (87, 101), «Su espectro UV no presenta máximos por encima de 200 nm»; B «presenta una señal de grupo carbonilo fuerte a 1 715 cm⁻¹ en el espectro de IR y un máximo débil a 274 nm (ε = 16) en el espectro de UV», ión molecular m/z = 72: sí, todos los números",
 "respuesta → p. A5 (×4): «18.73. A es el cetal etilénico de la 2-butanona.»: sí, literal; B no está nombrado: sí",
 "Problema 18.74 → p. 834 (×2,7): «(Historia real.)», botella sin etiqueta, tres estudiantes; «λmáx a 220 nm (ε = 16 000) y a 314 nm (ε = 65)»: sí; respuesta A5: «trans-2-butenal (crotonaldehído)»: sí",
 "Problema 18.67 → p. 831 (×2,7): «λmáx a 225 nm (ε = 10 000) y a 318 nm (ε = 40)»: sí; sin respuesta en A5: sí",
 "Problema 18.42 → p. 827: «Prediga los valores de λmáx para las transiciones π → π* y n → π* del espectro de UV del 3-metilciclohex-2-enona»: sí; respuesta A5: «240 nm y 300-320 nm»: sí",
 "cuentas: 16 000 ÷ 65 = 246; 10 000 ÷ 40 = 250; 2-butanona C₄H₈O = 72: correctas",
 "«absorción molar» para ε: es el término del libro (§ 15.13C, p. 669: «ε = absorción molar (o coeficiente de extinción molar)»): sí",
 "apunte ap-cap12b: el párrafo del ancla usa «transiciones baratas (n → π*, π → π*)»; el apunte ya da ε ≈ 10–20 para la n → π* y 10 000–20 000 para la π → π* (Morrison y Boyd): coherente",
 "referencia: Problemas 18.42, p. 827; 18.67, p. 831; 18.73, p. 833; 18.74, p. 834; p. A5 → sí",
], repite="No repite el apunte actual. Aviso fuera del apunte actual: las notas pendientes W18a-09 y W18a-11 (§ 18.5E, mismo capítulo) explican las dos bandas del carbonilo y sus ε; ésta es la práctica con problemas y conviene que quede después de ellas. Alcance: se deja «catedra» porque practica lo que el capítulo ya enseña (bandas n → π* y π → π* y su intensidad); usa de paso un dato de IR (1 715 cm⁻¹) y uno de masas (72), que son de espectroscopía.")
EOF
python3 build.py