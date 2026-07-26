# conference-templates

This project provides templates for the Modelica conferences.

## Usage

### Microsoft Word templates

Word templates live in `MSWord/`:

| Document | Purpose |
|----------|---------|
| [`example-paper.dotx`](MSWord/example-paper.dotx) | Scientific conference paper |
| [`example-user-presentation.dotx`](MSWord/example-user-presentation.dotx) | Industrial / user presentation **one-pager** for the programme |

Open the `.dotx` file in Microsoft Word (or a compatible editor) and save a new `.docx` for your contribution. Reference PDFs are provided next to each template.

### L<sup>A</sup>T<sub>E</sub>X templates

In the `LaTeX/` directory you can find a special [`modelica.cls`](LaTeX/modelica.cls)
class file and example documents:

| Document | Class option | Purpose |
|----------|--------------|---------|
| [`example-paper.tex`](LaTeX/example-paper.tex) | (default) | Scientific conference paper (two-column) |
| [`example-user-presentation.tex`](LaTeX/example-user-presentation.tex) | `userpresentation` | Industrial / user presentation **one-pager** (single-column) for the programme |

The project contains also a [`Makefile`](LaTeX/Makefile) which you can adjust to your needs:

```bash
cd LaTeX
make                          # build both examples
make example-paper.pdf
make example-user-presentation.pdf
```

#### User presentation one-pager

User presentations are **not** scientific publications. They are typically given by
industrial users or practitioners. The one-pager is included in the conference
programme so attendees can decide whether the talk is of interest.

It shares **margins, fonts, and title/author layout** with the scientific paper
template, but uses a **single column**, recommends a **figure after the title**,
then a short **presentation abstract without an “Abstract” heading**, and
optionally a few **references** (software links or closely related work). The
entire contribution must fit on **one A4 page**.

## License

&copy; Copyright 2015- Modelica Association

This work may be distributed and/or modified under the
conditions of the [LaTeX Project Public License](LICENSE), either version 1.3
of this license or (at your option) any later version.
The latest version of this license is in
http://www.latex-project.org/lppl.txt
and version 1.3 or later is part of all distributions of LaTeX
version 2005/12/01 or later.

## Contributions

See [list of contributors](../../graphs/contributors).

[Issues](../../issues) or [pull request](../../pulls) are always welcome.
