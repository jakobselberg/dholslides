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
* **DTT / CoC** *(Lean, Rocq, Agda)*: **dependent types**, separate definitional vs. propositional equality that keep type-checking decidable.

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
* but many interactive theorem provers use **DTT**
* **DHOL** brings dependent types close to HOL ATPs:
  * A sound & complete translation (`DHOL → HOL`) lets existing HOL provers run on problems that contain dependent types.

:::fragment fadeUp
* The goal is to close the interoperability gap between worlds
:::

:::notes
Ok, but why build DHOL?
Because HOL has decades of very strong automated theorem provers, while automation for full dependent type theory is much harder.
DHOL lets you use dependent types while staying close enough to HOL that we can translate DHOL problems to HOL provers—or build native DHOL provers—under a shared TPTP standard. It can also serve as a clean intermediate representation for hammering from systems like Lean.
And the trade-off of undecidable type-checking is acceptable because theorem proving is undecidable anyway.
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
(~80s)
:::

# 4. What are DHOL's Semantics?

How do we interpret function types in a model? *(Rabe, IJCAR 2026)*

* **Strict Models** *(the natural idea)*
  * Types $`\mapsto` sets, dependent functions $`\mapsto` **real** mathematical functions.
  * **Sound**, but **not complete** (same classic issue as standard HOL models).

:::fragment fadeUp
* **Lax Models** *(generalizing Henkin models)*
  * Function types can be interpreted more flexibly — as long as **Booleans** and **substitution** still behave properly.
  * **Sound and complete!** (via a term-model construction)
:::

:::notes
So what do DHOL's semantics actually look like? Florian Rabe's recent paper introduces two kinds of models.
First, strict models: the intuitive approach where dependent functions in DHOL map to real set-theoretic functions. This is sound, but—just like standard models in HOL—not complete.
To get completeness, Rabe introduces lax models, generalizing Henkin models: you relax how function types are interpreted, requiring only that Booleans and substitution behave properly. With lax models, we get both soundness and completeness.
(~90s)
:::

# 5. Formalizing Them — What & Why?

* **What does it mean?**
  * Encode DHOL's syntax, proof rules, models, and soundness/completeness proofs inside a proof assistant (**Lean 4**) so a computer checks every step.

:::fragment fadeUp
* **Why do it?**
  * Because typing is undecidable and intertwined with provability, the paper proofs have tight **mutual dependencies** — easy to overlook subtle edge cases on paper.
  * A machine-checked semantics provides a trustworthy reference for future provers and translations.
:::

:::notes
Finally: what does it mean to formalize these semantics, and why bother?
Formalizing means encoding the syntax, proof rules, model definitions, and soundness and completeness proofs in Lean 4 so the computer checks every detail.
Why is that worthwhile here? Because DHOL's undecidable typing tightly couples syntax, typing, proofs, and semantics in mutual inductions—it's exactly the kind of delicate metatheory where paper proofs can hide subtle gaps. A verified formalization gives us a rock-solid reference.
(~80s)
:::

# The Lean Formalization

```html
<div style="font-size: 6em; font-weight: bold; text-align: center; margin-top: 0.3em;">?</div>
```

:::notes
And as for how the Lean formalization itself will look in detail—that's still a big question mark right now as I'm just getting started.
Thanks for listening!
(~30s)
:::
