/-
Presentation: Formalizing the Semantics of DHOL (Master's Thesis Task)
Built with VersoSlides.
-/

import VersoSlides

open VersoSlides

set_option verso.code.warnLineLength 500
set_option verso.slides.panel false

#doc (Slides) "Formalizing the Semantics of DHOL" =>

# Formalizing the Semantics of DHOL

*Master's Thesis Task*

* **Author:** Jakob Selberg
* **Tool:** Lean 4 & VersoSlides
* **Duration:** ~10 minutes

:::notes
Hi everyone! Today I'll present my master's thesis task: formalizing the semantics of DHOL in Lean 4.
Instead of diving into heavy notation, I want to tell the simple story: what DHOL is, what its semantics does, and what my thesis will build in Lean 4.
(~45s)
:::

# Big Picture

* **Interactive Theorem Provers** (Lean, Rocq, Agda)
  * Have **dependent types** :  types can depend on values (e.g., lists of length $`n`).

:::fragment fadeUp
* **Automated Theorem Provers** (HOL provers)
  * Great automation ("hammers"), but **no dependent types**.
:::

:::fragment fadeUp
* **DHOL** (*Dependently-Typed HOL*) :
  * Extends HOL with dependent types while staying compatible with **HOL ATP automation**.
:::


# Why DHOL Is Tricky (One Example)

Suppose we have vectors of length $`n`: $`\mathsf{Vec}(A, n)`.

* Concatenating a vector of length $`n` with an empty vector gives length $`n + 0`.
* Is $`\mathsf{Vec}(A, n + 0)` the same type as $`\mathsf{Vec}(A, n)`?

:::fragment fadeUp
That depends on whether $`n + 0 = n` is **provable**!
:::

:::fragment fadeUp
* **In Lean:** type-checking stays decidable by separating "obvious" equality from proved equality.
* **In DHOL:** any provable equality counts — so **type-checking becomes undecidable**.
:::

:::notes
Why isn't adding dependent types to HOL trivial? Here's the core intuition.
If types depend on numbers like vector length, then checking whether two types match can require proving arithmetic facts like n + 0 = n.
Lean keeps type-checking decidable with special rules. DHOL takes the simpler route: it allows any provable equality, which makes type-checking undecidable. Since theorem proving is undecidable anyway, DHOL treats that as a worthwhile trade-off.
(~60s)
:::

# What Does "Semantics" Mean Here?

Syntax and proof rules tell us **what we can write and prove**.

**Semantics** tells us **what it all means**:
* Types $`\mapsto` sets
* Terms $`\mapsto` elements of those sets
* Formulas $`\mapsto` true or false

:::fragment fadeUp
Why do we need a semantics for DHOL?
1. **Sanity check (Soundness):** everything we prove is actually true.
2. **Completeness:** no proof rules are missing.
3. **Reference:** a solid foundation for building provers and translations.
:::

:::notes
So what does "semantics" mean?
Right now, DHOL is mostly defined by its syntax and proof rules. A model-theoretic semantics gives meaning to those symbols: types become sets, terms become elements, and formulas become truth values.
This lets us check two crucial properties: soundness (the proof rules never lie) and completeness (the proof rules aren't missing anything).
(~60s)
:::

# Two Kinds of Models: Strict vs. Lax

How do we interpret function types in a model?

* **Strict Models** *(the straightforward idea)*
  * Functions in DHOL map to **real** mathematical functions.
  * **Sound**, but **not complete** (same classic issue as standard HOL models).

:::fragment fadeUp
* **Lax Models** *(the clever fix, inspired by Henkin)*
  * Allow function types to be interpreted more flexibly — as long as **substitution still works** and **Booleans behave normally**.
  * **Sound and complete!**
:::

:::notes
There's a classic twist from Higher-Order Logic that also happens in DHOL.
In a "strict" model, DHOL functions are interpreted as actual set-theoretic functions. That's intuitive and sound, but not complete.
To get completeness, Florian Rabe's paper introduces "lax" models (a generalization of Henkin models): you don't force function types to be real functions, as long as substitution and Booleans still behave properly. With lax models, we get both soundness and completeness.
(~65s)
:::

# The Lean Formalization

```html
<div style="font-size: 6em; font-weight: bold; text-align: center; margin-top: 0.3em;">?</div>
```

:::notes
And that brings us to the Lean formalization part—which is still an open question mark right now as I'm just starting the thesis!
:::
