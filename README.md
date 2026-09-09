# ENSLyonStage — LaTeX class for ENS de Lyon Biosciences internship reports

**Version 2.2** | **License: LPPL 1.3c** | **Author: Adama Mbaye**

A LaTeX2e class for M1 and M2 internship reports following the formatting
guidelines of the École Normale Supérieure de Lyon Biosciences Master programme.

## Usage

```latex
\documentclass{enslyonstage}           % orange theme (default)
\documentclass[blue]{enslyonstage}     % named colour theme
```

Start from `enslyonstage-gabarit.tex`. See `enslyonstage.pdf` for the full
user guide.

## Compilation

Requires **pdfLaTeX + biber**:

```
pdflatex enslyonstage-gabarit
biber    enslyonstage-gabarit
pdflatex enslyonstage-gabarit
pdflatex enslyonstage-gabarit
```

On Overleaf: set compiler to `pdfLaTeX` and bibliography tool to `biber`
(Menu → Compiler).

## Files

| File | Description |
|------|-------------|
| `enslyonstage.cls` | The LaTeX class |
| `enslyonstage.tex` | Source of the user guide |
| `enslyonstage.pdf` | Compiled user guide |
| `enslyonstage-gabarit.tex` | Blank report template (start here) |
| `enslyonstage-exemple.tex` | Source of the visual demonstration |
| `enslyonstage-exemple.pdf` | Compiled visual demonstration — based on a real M1 report ([Mbaye 2026, Zenodo](https://doi.org/10.5281/zenodo.21631816)), not a model for scientific content |
| `references.bib` | Sample bibliography for `enslyonstage-gabarit.tex` |
| `skipping_ref.bib` | Bibliography for `enslyonstage-exemple.tex` |
| `figures/` | Screenshots for the user guide + figures used in the demonstration |
| `logos/` | ENS de Lyon branding assets (banners, logos) |
| `LICENSE` | LPPL 1.3c licence text |

## Colour themes (22)

`orange` (default) · `violet` · `blue` · `red` · `green` · `teal` · `gray`
· `navy` · `indigo` · `purple` · `pink` · `crimson` · `amber` · `gold`
· `lime` · `forest` · `cyan` · `azure` · `slate` · `brown` · `wine` · `midnight`

## License

Copyright (C) 2026 Adama Mbaye.
Released under the LaTeX Project Public License v1.3c or later.
See `LICENSE` or <https://www.latex-project.org/lppl/lppl-1-3c/>
