# Formalizing the Semantics of DHOL — Slides

Presentation slides for my master's thesis task, built with [VersoSlides](https://github.com/leanprover/verso-slides) (Lean 4 + `reveal.js`).

Live version: https://jakobselberg.github.io/dholslides/

## Build & Preview Locally

```bash
lake build
lake exe dhol-slides
python3 -m http.server -d _slides
```

## Hosting

Pushes to `main` automatically build and deploy `_slides/` to GitHub Pages via `.github/workflows/pages.yml`.
