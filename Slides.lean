/-
Presentation: Formalizing the Semantics of DHOL (Master's Thesis Task)
Built with VersoSlides.
-/

import VersoSlides

open VersoSlides

set_option verso.code.warnLineLength 500
set_option verso.slides.panel false

#doc (Slides) "Formalizing the Semantics of DHOL" =>

# Formalizing the Semantics of DHOL in Lean

*Master's Thesis Antrittspraesentation*


:::notes
Hi everyone! Today I'll introduce my master's thesis task: formalizing the semantics of DHOL in Lean 4.
I'll walk through five simple questions: what DHOL is, why we want it, what semantics means, what DHOL's semantics looks like, and why we'd formalize it in Lean.
(~45s)
:::

# 1. What is DHOL?


* **HOL** *(Higher-Order Logic)*: simple types, classical Booleans, one equality relation.
* **DTT** *Dependent Type Theory*: **dependent types**, separate definitional vs. propositional equality that keep type-checking decidable.

:::fragment fadeUp
* **DHOL** *(Dependently-Typed HOL)*:
  * Adds **dependent types** directly to HOL.
  * Keeps classical Booleans and a single equality at the cost of **undecidable type-checking**.
:::

:::notes
First: what is DHOL?
Think of two established worlds. Higher-Order Logic has simple types, classical Booleans, and a single equality. Dependent Type Theory—like the Calculus of Constructions behind Lean and Rocq—gives us dependent types like vectors of length n, but needs a careful split between definitional and propositional equality to keep type-checking decidable.
DHOL sits in between: it adds dependent types directly to HOL while keeping classical Booleans and a single equality, accepting that type-checking becomes undecidable.
(~90s)
:::

# 2. Ok, but why?

* **HOL** has mature, strong **Automated Theorem Provers (ATPs)**
  * e.g., Leo-III, Satallax, Zipperposition
* but many interactive theorem provers (ITPs) are based on **DTT**
  * e.g., Lean, Rocq, Agda
* **DHOL** brings dependent types close to HOL ATPs:
  * A sound & complete translation (`DHOL → HOL`) lets existing HOL provers run on problems that contain dependent types.

:::fragment fadeUp
* The goal is to close the interoperability gap between worlds
:::

:::notes
Ok, but why build DHOL?
Because HOL has decades of very strong automated theorem provers.
DHOL lets you use dependent types while staying close enough to HOL that we can translate DHOL problems to HOL provers—or build native DHOL provers. It can also serve as a intermediate representation for hammering from systems like Lean.
And the trade-off of undecidable type-checking might be acceptable because theorem proving is undecidable anyway.
(~90s)
:::

# 3. What are Semantics?

Syntax and proof rules alone are just symbol manipulation.

* Like layers in a **protocol stack**, formal systems need to be grounded in meaning to be useful.
* **Model theory** gives that grounding:
  * Types $`\mapsto` sets
  * Terms $`\mapsto` elements
  * Formulas $`\mapsto` true or false

:::fragment fadeUp
This lets us ask two fundamental questions:
1. **Soundness:** Is everything we can prove actually true?
2. **Completeness:** Can we prove everything that is true?
:::

:::notes
Next, a quick refresher: what are semantics?
By themselves, syntax and proof rules are just rules for pushing symbols around. Like a protocol stack, a formal system only becomes useful when it is grounded in actual meaning.
Model theory provides that grounding: types mean sets, terms mean elements, and formulas mean truth values. Once we have that, we can check soundness—our rules never prove false things—and completeness—our rules aren't missing anything.
(~80s) (maybe even calling something a proof/proof rule without a notion of truth is abuse of notation, because in common english those notions are intertwined)
:::

# 4. What are DHOL's Semantics?

Most of the interpretation is forced: types are sets, terms are elements, Booleans are true/false.
The one real design choice is **function types**, since a model has to decide *which* functions exist. *(Rabe, IJCAR 2026)*

* **Strict Models** *(the natural idea)*
  * Function types are interpreted as **all** mathematical functions.
  * **Sound**, but **not complete**: the proof rules cannot capture every property of "all functions".
* **Lax Models** *(generalizing Henkin models, which use only a subset of functions in HOL)*
  * Function types may be **arbitrary sets**, as long as **Booleans** and **substitution** still behave properly.
  * **Sound and complete!** (via a term-model construction)

:::notes
So what do DHOL's semantics actually look like? there are two kinds of models:
strict models: the intuitive approach where dependent functions in DHOL map to real set-theoretic functions. This is sound, but not complete;
secondly, lax models : you relax how function types are interpreted, requiring only that Booleans and substitution behave properly. With lax models, we get both soundness and completeness.
(~90s)
:::

# 5. Formalizing Them — What & Why?

* **What does it mean?**
  * Encode DHOL's syntax, proof rules, models, and soundness/completeness proofs

:::fragment fadeUp
* **Why do it?**
  * **Trust:** DHOL's typing is undecidable and intertwined with provability, so syntax, typing, proofs, and semantics depend on each other in one big mutual argument. It's easy to overlook subtle cases on paper; a proof assistant checks every one.
  * **Reference:** a formally verified semantics is something other tools can build on, e.g., provers, calculi, and translations such as `DHOL → HOL` can be checked against it.
:::

:::notes
Finally: what does it mean to formalize these semantics, and why bother?
Formalizing means encoding the syntax, proof rules, model definitions, and soundness and completeness proofs in Lean 4 so the computer checks every detail.
Why is that worthwhile here? First, trust: DHOL's undecidable typing tightly couples syntax, typing, proofs, and semantics in mutual inductions, which is exactly the kind of delicate metatheory where paper proofs can hide subtle gaps, and Lean forces every case to be handled. Second, a formally verified semantics can serve as a reference that other tools, such as provers and translations like DHOL to HOL, can be checked against.
(~80s)
:::

# The Lean Formalization

```html
<div style="font-size: 4em; font-weight: bold; text-align: center; margin-top: 0.2em;">?</div>
```

* **Scope:** ? (open ended)
* **Current status:** still playing with toy examples

:::notes
And as for how the Lean formalization itself will look in detail, that's still a big question mark right now. The scope is open ended, and so far I'm still playing with toy examples.
Thanks for listening!
(~30s)
:::

# Key Literature

* **Rothgang, Rabe, Benzmüller (2025)** — *Dependently Typed Higher-Order Logic* (ACM ToCL)
  * Introduces DHOL and the sound & complete `DHOL → HOL` translation.
* **Rabe (2026)** — *Semantics for Dependently-Typed HOL* (IJCAR 2026)
  * Defines strict and lax models for DHOL and proves soundness & completeness.
* **Kemal Yüksel** — *Formalization of DHOL Syntax*
  * Existing formalization of DHOL syntax to build on.

:::notes
Here are the main references this thesis builds on. Happy to take any questions!
:::
