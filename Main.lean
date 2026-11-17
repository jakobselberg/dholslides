import VersoSlides
import Slides

open VersoSlides

def customCss : CssFile where
  filename := "custom.css"
  contents := ⟨"
:root {
  --r-main-font-size: 26px;
  --r-heading1-size: 1.75em;
  --r-heading2-size: 1.35em;
}

.reveal .slides section {
  overflow-y: auto !important;
  max-height: 100%;
}

.reveal pre {
  font-size: 0.72em;
  line-height: 1.3;
}

.reveal ul, .reveal ol {
  margin-top: 0.3em;
  margin-bottom: 0.3em;
}

.reveal li {
  margin-bottom: 0.25em;
}
"⟩

public def main : IO UInt32 :=
  slidesMain
    (config := {
      theme := "white",
      slideNumber := true,
      transition := "slide",
      width := 1280,
      height := 720,
      margin := 0.06,
      extraCss := #[customCss]
    })
    (doc := %doc Slides)
