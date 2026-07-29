# ENSLyonStage — LaTeX class for ENS de Lyon Biosciences internship reports

**Version 2.0** | **License: LPPL 1.3c** | **Author: Adama Mbaye**

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
| `enslyonstage.pdf` | Full user guide (built from `enslyonstage.tex`) |
| `enslyonstage-gabarit.tex` | Blank report template |
| `enslyonstage-exemple.tex` | Fully worked example |
| `references.bib` | Sample bibliography database |
| `logos/` | ENS de Lyon branding assets |

## Colour themes (22)

`orange` (default) · `violet` · `blue` · `red` · `green` · `teal` · `gray`
· `navy` · `indigo` · `purple` · `pink` · `crimson` · `amber` · `gold`
· `lime` · `forest` · `cyan` · `azure` · `slate` · `brown` · `wine` · `midnight`

## License

Copyright (C) 2026 Adama Mbaye.
Released under the LaTeX Project Public License v1.3c or later.
See `LICENSE` or <https://www.latex-project.org/lppl/lppl-1-3c/>
