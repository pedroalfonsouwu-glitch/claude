import json
src={n['id']:n for n in json.load(open('/home/claude/work/wade3/out_W21b.json',encoding='utf-8'))}
def rep(t,old,new):
    assert t.count(old)==1,(old,t.count(old))
    return t.replace(old,new)
R=[]
t=src['W21b-17']['texto']
t=rep(t,"Un alcohol o una amina atacan al del formilo; el libro lo señala con el rótulo «carbonilo más reactivo».",
 "Un alcohol o una amina atacan sobre todo al del formilo: el libro dice que este anhídrido «reacciona principalmente a través del grupo formilo», y lo señala con el rótulo «carbonilo más reactivo».")
t=rep(t,"La razón, con las palabras del libro: «La falta de un grupo alquilo voluminoso, donante de electrones» «hace que el grupo formilo esté menos impedido y sea más electrofílico que el grupo acetilo».",
 "La razón, con las palabras del libro: la falta de un grupo alquilo voluminoso y donante de electrones «hace que el grupo formilo esté menos impedido y sea más electrofílico que el grupo acetilo».")
R.append({"id":"W21b-17","veredicto":"corregir",
"comprobado":[
 "apunte ap-cap33: «Los grupos que donan electrones al carbono carbonílico lo hacen menos positivo y frenan la reacción… un metilo dona por hiperconjugación» → sí",
 "p. 980, punto 2 «Utilización de anhídrido acético fórmico» (ampliado ×3): «reacciona principalmente a través del grupo formilo. La falta de un grupo alquilo voluminoso, donante de electrones, hace que el grupo formilo esté menos impedido y sea más electrofílico que el grupo acetilo.»: sí",
 "ecuaciones de la p. 980 (ampliadas): CH₃–CO–O–CO–H + R–OH → H–CO–O–R (formiato) + CH₃COOH; CH₃–CO–O–CO–H + R–NH₂ → H–CO–NH–R (formamida) + CH₃COOH; rótulo «carbonilo más reactivo» sobre el C=O del formilo: sí",
 "referencia § 21.11, p. 980: sí",
 "química (efecto electrónico + impedimento estérico): correcta"],
"problemas":[
 "La cita está partida en dos pares de comillas pegados («…donante de electrones» «hace que…») y salta la coma del original; juntas son una sola frase de 26 palabras. Queda entre comillas sólo la segunda mitad (16 palabras) y la primera pasa a texto de la nota.",
 "«atacan al del formilo»: el libro dice «reacciona principalmente a través del grupo formilo». Se repone el matiz."],
"texto_corregido":t,
"ancla_ok":True,"ancla_nota":"",
"alcance_ok":True,
"repite":""})

R.append({"id":"W21b-18","veredicto":"ok",
"comprobado":[
 "citas «Los nitrilos se hidrolizan a amidas y posteriormente a ácidos carboxílicos» (calentándolos con una disolución acuosa ácida o básica) y «Si las condiciones son suaves, el nitrilo sólo se hidroliza a amida.» → p. 971, § 21.7D (ampliada ×3): sí, literales",
 "esquema básico, p. 971 (ampliado): R–C≡N + H₂O (⁻OH, H₂O) → R–CO–NH₂ «amida primaria» (⁻OH, H₂O) → R–COO⁻ «ión carboxilato» + NH₃: sí",
 "esquema ácido, p. 972 (ampliado): R–C≡N (H⁺, H₂O) → R–CO–NH₂ (H⁺, H₂O) → R–COOH + NH₄⁺: sí",
 "ejemplos: nicotinonitrilo, NaOH, H₂O/EtOH, 50 °C → nicotinamida (p. 971); Ph–CH₂–C≡N, H₂SO₄, calor, H₂O/EtOH → ácido fenilacético (p. 972): sí",
 "cita «carbono electrofílico del grupo ciano» → p. 972 (ampliada): sí",
 "recuadro «Hidrólisis catalizada por una base de un nitrilo», p. 972 (ampliado): primera línea «Ataque del ión hidróxido y reprotonación» → R–C(OH)=N–H, rótulo «tautómero: enol de la amida», + ⁻OH; segunda línea «Eliminación y desplazamiento de un protón (tautomerización)» → amida + ⁻OH: sí; el HO⁻ aparece como producto al final de las dos líneas: sí",
 "cita «promovido por una base» (hidrólisis posterior de la amida al carboxilato) → p. 972: sí",
 "Problemas 21.22 (hidrólisis básica del benzonitrilo a ión benzoato y amoniaco) y 21.23 (hidrólisis ácida del benzonitrilo a benzamida), p. 972: sí; p. A6: sin respuesta de ninguno de los dos: sí",
 "referencia § 21.7D, pp. 971–972: sí",
 "las aclaraciones sobre la electronegatividad del N y sobre tautómeros frente a resonancia van marcadas [ADICIÓN PEDAGÓGICA] y son correctas"],
"problemas":[],
"texto_corregido":"",
"ancla_ok":True,"ancla_nota":"",
"alcance_ok":True,
"repite":"El ejemplo fenilacetonitrilo → ácido fenilacético ya está en la nota de § 20.8C que sigue a ese párrafo (nitrilo → ácido). Lo nuevo: que pasa por la amida y se puede frenar ahí, las condiciones, el mecanismo básico y la tautomerización."})

t=src['W21b-19']['texto']
t=rep(t,"Para frenar en el aldehído hace falta partir de un cloruro de ácido y usar un hidruro más suave, el hidruro de tri(terc-butoxi)aluminio y litio, Li(t-BuO)₃AlH: cloruro de octanoílo → octanal.",
 "Para frenar en el aldehído vale lo que ya dice la otra nota de esta pregunta: partir de un cloruro de ácido y usar un hidruro más suave. Acá el libro le pone nombre, hidruro de tri(terc-butoxi)aluminio y litio, y lo escribe Li(t-BuO)₃AlH (t-Bu es el terc-butilo, (CH₃)₃C–; es el mismo reactivo que en esa nota figura como LiAl[OC(CH₃)₃]₃H). Ejemplo: cloruro de octanoílo → octanal.")
R.append({"id":"W21b-19","veredicto":"corregir",
"comprobado":[
 "«agente reductor fuerte como el hidruro de aluminio y litio (LiAlH₄)» → p. 972, § 21.8 (ampliada): sí",
 "ecuación general, p. 973 (ampliada): R–CO–O–R′ (o R–CO–Cl), LiAlH₄ → R–CH₂O⁻ ⁺Li + R′–O⁻ ⁺Li, H₃O⁺ → R–CH₂OH (alcohol primario) + R′–OH: sí",
 "ejemplo 2-fenilacetato de etilo, (1) LiAlH₄ (2) H₃O⁺ → 2-feniletanol + CH₃CH₂OH → p. 973: sí",
 "cita «mediante un mecanismo de adición-eliminación para dar lugar a un aldehído, que rápidamente se reduce a un alcóxido» → p. 973 (ampliada): sí, literal; «se añade ácido diluido para protonar el alcóxido»: sí",
 "recuadro «Reducción de un éster por un hidruro», p. 973 (ampliado): Paso 1 «adición del nucleófilo (hidruro)» con flecha desde el enlace Al–H; «intermedio tetraédrico»; Paso 2 «eliminación del alcóxido» → aldehído + alcóxido; Paso 3 «adición de un segundo ion hidruro» → sal → H₃O⁺ → alcohol primario: sí",
 "§ 21.8B, p. 973: los cloruros de ácido «se reducen a aldehídos utilizando agentes reductores suaves como el hidruro de tri(terc-butoxi)aluminio y litio»; reactivo impreso Li(t-BuO)₃AlH; ejemplo CH₃(CH₂)₆–CO–Cl → CH₃(CH₂)₆–CHO, cloruro de octanoílo → octanal, p. 974 (ampliado): sí",
 "cuenta del estado de oxidación (éster +3, alcohol −1), marcada [ADICIÓN PEDAGÓGICA]: correcta con las reglas del capítulo",
 "referencias § 21.8, 21.8A y 21.8B, pp. 972–974: sí"],
"problemas":[
 "Repite la nota de § 20.14 que ya está en la misma pregunta («pasar el ácido a cloruro de ácido y reducirlo con un hidruro más débil, LiAl[OC(CH₃)₃]₃H»), y además el mismo reactivo queda escrito de dos maneras en dos notas vecinas sin avisar que es el mismo. Se deja lo nuevo (el nombre, el ejemplo del octanal) y se enlaza con esa nota.",
 "«t-BuO» sin explicar: se agrega qué es t-Bu."],
"texto_corregido":t,
"ancla_ok":True,"ancla_nota":"",
"alcance_ok":True,
"repite":"Parcial: la frase sobre el cloruro de ácido y el hidruro suave repetía la nota de § 20.14 (misma pregunta del apunte). Que el LiAlH₄ lleva un éster a R–CH₂–OH ya figura, sin mecanismo, en la nota de § 10.11 de ap-cap35. El mecanismo en tres pasos, los dos alcoholes y los ejemplos son nuevos."})

t=src['W21b-20']['texto']
t=rep(t,"[ADICIÓN PEDAGÓGICA: cómo leer las respuestas. En todas, el C=O pasó a CH₂ y el nitrógeno sigue en su lugar.",
 "[ADICIÓN PEDAGÓGICA: cómo leer las respuestas. El butironitrilo de (a) es CH₃CH₂CH₂–C≡N. La ε-caprolactama de (c) es una amida cíclica: un anillo de siete miembros con un N–H y un C=O vecinos. En las amidas, de (b) a (e), el C=O pasó a CH₂ y el nitrógeno sigue en su lugar; en el nitrilo de (a), el –C≡N pasó a –CH₂–NH₂.")
R.append({"id":"W21b-20","veredicto":"corregir",
"comprobado":[
 "§ 21.8C, p. 974 (ampliada): «Las amidas primarias y los nitrilos se reducen a aminas primarias. Las amidas secundarias se reducen a aminas secundarias y las amidas terciarias a aminas terciarias.»: sí",
 "esquemas, p. 974 (ampliados): R–CO–NH₂ → R–CH₂–NH₂; R–CO–NHR′ → R–CH₂–NHR′; R–CO–NR′₂ → R–CH₂–NR′₂, los tres con (1) LiAlH₄ (2) H₂O; nitrilos: R–C≡N, «H₂/Pt o (1) LiAlH₄; (2) H₂O» → R–CH₂–NH₂: sí",
 "ejemplo acetanilida CH₃–CO–NH–Ph → N-etilanilina CH₃–CH₂–NH–Ph → p. 974: sí",
 "Problema 21.25, p. 974 (ampliado ×3): reducción con hidruro de aluminio y litio (seguida de hidrólisis) de (a) butironitrilo, (b) N-ciclohexilacetamida, (c) ε-caprolactama, (d) anillo de seis con O, N–H y C=O junto al N, (e) N unido a ciclohexilo, CH₃ y CO–CH₂CH₃, (f) biciclo (anillos de seis y de cinco fusionados) con CN: sí",
 "respuesta impresa 21.25, p. A6 (ampliada ×4): «(a) 1-butanamina; (b) ciclohexil etil amina; (c) (CH₂)₆NH-(anillo de siete miembros); (d) morfolina; (e) ciclohexil metil propil amina»: sí, coincide; no hay inciso (f): sí",
 "química de las respuestas: (b) acetilo → etilo; (e) propanoílo → propilo; (c) y (d) el anillo se conserva: correcta",
 "referencias § 21.8C y Problema 21.25, p. 974; Soluciones, p. A6: sí"],
"problemas":[
 "«En todas, el C=O pasó a CH₂»: el inciso (a) es un nitrilo y no tiene C=O; ahí el –C≡N pasa a –CH₂–NH₂. Se separan los dos casos.",
 "«butironitrilo» y «ε-caprolactama» van sólo con el nombre, y sin la fórmula no se pueden contar los carbonos ni ver que (c) es una amida en anillo. Se agrega qué son, dentro de la adición pedagógica."],
"texto_corregido":t,
"ancla_ok":True,"ancla_nota":"",
"alcance_ok":True,
"repite":"Las reglas (amida → amina, nitrilo → amina con LiAlH₄ o con H₂ y catalizador) ya están en la nota de § 19.19B que sigue a ese mismo párrafo. Acá van en una línea, como base del ejercicio; lo nuevo es el Problema 21.25 con su respuesta impresa y la distinción entre amida primaria, secundaria y terciaria."})
json.dump(R,open('frag/e.json','w',encoding='utf-8'),ensure_ascii=False)
