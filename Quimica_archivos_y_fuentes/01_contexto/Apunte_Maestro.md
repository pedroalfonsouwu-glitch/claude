## Apunte Maestro

Purpose, current state, and working structure of the Organic Chemistry master study guide project (all chapters 0–15 drafted)

- Pedro is a university student in an Organic Chemistry course at the Facultad de Ciencias Agropecuarias

- The project is to build a comprehensive, rigorously sourced master study guide ("apunte maestro") in Spanish

- All work is in Spanish, with technical chemistry terminology in Spanish

- Pedro functions as project director: he sets standards and enforces corrections throughout

- The project is academically high-stakes and methodologically demanding

## Bibliography

- Primary bibliography: Fernández Cirelli (cap. 1) and Wade 5th ed. (caps. 1–2)

- The Morrison/Boyd Study Guide is supplementary only and is never counted as a primary source

- Missing core source throughout the project: the Morrison and Boyd main text, chapter 1 — still to be acquired

- Source materials: 8 course files (PDFs, ZIPs containing JPEGs and TXT)

## Current state (V8 — verify before relying on it)

- V8 is the most current verified state

- V8 metrics: 218 atomic claims; 125/125 items; 11/11 NOT_APPLICABLE items preserved; 82 items with primary bibliography support

- All 15 mandatory autochecks are at zero in V8

- All chapters 0–15 plus three annexes are now written, with 17 original figures (book and slide figures are never copied)

## Artifacts and tooling

- Authoritative ledger artifacts maintained: item ledger, conflict ledger, claim ledger, chapter matrix, atomic claim ledger, page-item evidence ledger, and others

- Artifacts are packaged in versioned ZIPs with SHA-256 hash verification

- Set equality is checked across packages: ZIP SET = MANIFEST SET = INVENTORY SET

- Artifact system: interconnected CSV ledgers, versioned ZIP packages, SHA-256 hashing, manifest/inventory set equality checks

## Approach and working patterns

- Strict phase/version sequencing: Phase 1B → 1C → 1D → 2A → reconciliation rounds → V3–V8

- Each version rebases on the prior version rather than rebuilding from scratch

- Dependency validation is enforced by a term registry with regex patterns and a per-occurrence ledger: no concept may appear before it is taught

- Pedagogical ordering of chapters is a core structural principle

- Pedro runs active correction cycles — catching false promotions, lineage regressions, range expansion, and misreported figures in Claude's outputs, and requiring explicit fixes before proceeding

## Figure conventions (HTML apunte)

- Hybrid orbitals (sp³, sp², sp) must be drawn as a small orange "cabecita" + blue "cuerpo" (teardrop, point at the nucleus), never as ovals/"orejas"; only pure p orbitals are drawn as "orejitas"

- Molecule figures (eteno, etino): white skeleton lines, each hybrid drawn on its skeleton line (head at C, body toward the other atom), electrons drawn inside the hybrids; pure p orbitals carry 1 e⁻ each

- π bonds are drawn joining the tips of the p orbitals above and below everything (π label outside), never as lines next to the σ bond axis

## How Pedro wants to study (stated 2026-09-26)

- Reading long text does not engage him; he wants the chemistry "desarmada" and drawn by parts — the same molecule shown from several points of view (orbitals, forces/red arrows, where the electrons move), with the reason for every arrow, like his own handwritten tablet notes

- He keeps his own handwritten notes for U1–U2 (PDF "U1 y U2") and cleaned transcripts of what the professor said (unidad_1_limpio.md, unidad_2_limpio.md); he says the professor gave him the materials, so no copyright concern

- The "limpio" md transcripts (U1–U6) were made in another chat from the audio-only class videos on his own channel (animal/monkey background, no whiteboard); the whiteboard/presentation videos are the other (virtual) professor's and look poor

- Plan: he will redraw the whiteboard parts of all videos by hand into a PDF, for Claude to later regenerate as nicer drawings

- Guide exercise statements are to be cut from the guide PDF and pasted as page crops, not retyped; he wants exercises reachable per unit (choosing a unit then "Ejercicios" shows only that unit's exercises)

- In the viewer where he opens the HTML, the JavaScript-dependent buttons (main menu, unit selection) did not work — the deliverable's navigation must work without JavaScript

- The course's exercise guide has a 2026 edition ("GUIA EDITADA 2026 JULIO", received 30/9); he was told only some exercises changed from the 2024 edition

- The 2024 guide is the principal reference whose structure the apunte follows; don't relabel the document as "guía 2026" — note "coincide con la versión 2026" where identical

- Lab practicals (TP 1, TP 2…) go together — theory plus exercises — under the "Ejercicios" section (own buttons, in TP order), not split off into the theory part

- He has photos of the original Laboratorio 1 handout (consigna), sent 1/10/2026; for TP1 the source hierarchy is: consigna Lab 1 → guía 2024 → lab class/teacher → theory classes → previous apunte/HTML → pedagogical additions; the old rule «no lab-specific guide available» is superseded but kept in history

- Solvent recovery/distillation is not in the Lab 1 consigna: label it as a complement from the lab class, never as «Actividad D de la consigna»

- TP 2 has two experiments: 1 «flores» (the vegetable is red cabbage/repollo morado — petals were just an example; acid = diluted vinegar, base = potassium bicarbonate) and 2 almidón

- Page 5 of the lab handout belongs to TP 1 (not TP 2); he has no more lab material than what he already sent ("el profe me dio lo que ya te di"), plus his own clean copies of the molecules the professor drew, meant to be redrawn with the molecule-building tool used for the exercises

- Said on 2/10/2026 that the guide being solved is the current 2026 edition, not 2024 ("estamos resolviendo 2026, no 2024") — in tension with the earlier "2024 is the principal reference / don't relabel" line; which label the page should carry is still undecided

- Working order: he is correcting the Unidad 2 exercise resolutions from exercise 8 onward to the end; only after that is finished will he send the material for Unidades 3, 4 and 5 — don't resolve those units' exercises before he sends it
