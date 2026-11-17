import Lake

open System Lake DSL

require verso from git "https://github.com/leanprover/verso.git"@"main"

package «verso-slides» where
  version := v!"0.1.0"
  requiresModuleSystem := true

input_dir vendorAssets where
  path := "vendor"

lean_lib VersoSlidesVendored where
  needs := #[vendorAssets]

input_dir webLibAssets where
  path := "web-lib"

lean_lib VersoSlides where
  needs := #[webLibAssets, `@subverso/«subverso-extract-mod»]

-- Ordinary source file so that hovers in Lean code include docstrings.
lean_lib Slides where
  needs := #[`@verso/+Verso.Code.External:highlighted]
  allowNonModules := true

@[default_target] lean_exe «dhol-slides» where
  root := `Main
  allowNonModules := true
