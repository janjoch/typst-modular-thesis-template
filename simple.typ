// A small, complete thesis built with MTT.
// Copy this file into your project and replace the example content. The

#import "@preview/mtt-thesis:0.1.0": *

// Acronyms are optional. Define them before using mtt-acronyms() below.
#import "@preview/acrostiche:0.7.0": *
#init-acronyms((
  "MTT": ("modular thesis template", "modular thesis templates"),
  "API": ("application programming interface", "application programming interfaces"),
))

#import "@preview/codly:2.0.0" as codly
#show raw.where(block: true): codly.new
#show: codly.theme("one-light")


// mtt-thesis controls the document-wide layout. The order of items in
// `before` and `after` is the order in which their pages are rendered.
#show: mtt-thesis.with(
  coverpage: mtt-coverpage(
    logo-left: image("template/eth_logo_kurz_cropped.svg", height: 25pt),
    logo-center: [],
    logo-right: rect(height: 35pt)[Department logo],
    org-units: (
      "Department of Everything",
      "Institute of Nothing",
    ),
    title: [A Very Inspiring Title],
    project-type: "Bachelor Thesis",
    date: datetime.today(),
    cover-image: image("template/cover-image.svg", width: 100%),
    authors: (
      (name: "Jane Doe", email: "janedoe@university.org"),
      (name: "John Doe", email: "johndoe@university.org"),
    ),
    authors-horizontal: true,
    advisors: ((name: "Advisor One", email: "advisor.one@university.org"),),
    professors: ((name: "Prof. Dr. Professor", email: "professor@university.org"),),
    empty-page: false,
  ),
  before: (
    mtt-abstract[
      This example shows the smallest useful configuration for a thesis. The
      document body follows the configuration below, while the lists and
      bibliography are added afterwards.
    ],
    mtt-toc(),
  ),
  after: (
    mtt-figures(),
    mtt-tables(),
    mtt-codes(),
    mtt-acronyms(),
    mtt-bibliography(
      bibliography(
        "references.bib",
        style: "american-physics-society",
        full: true,
        title: none,
      ),
    ),
    // Custom pages can be mixed with the built-in modules.
    page[
      = A custom appendix
      
      This page is ordinary content supplied by the document author.
    ],
    // Add this optional guide when starting to learn Typst.
    mtt-typst-guide(),
  ),
)

= Introduction

This is the document body. Write chapters directly in this file, or split
them into separate files with `#include("chapters/introduction.typ")`.

The #acr("MTT") provides sensible defaults while leaving
the document structure in your control. For example, the #acr("API") can be documented in the usual way.

== A figure and a table

Figures and tables are collected automatically by `mtt-figures()` and
`mtt-tables()`.

#figure(
  image("template/cover-image.svg", width: 70%),
  caption: [A figure included in the thesis.],
) <example-figure>

#figure(
  table(
    columns: (auto, 1fr),
    table.header([*Module*], [*Purpose*]),
    [mtt-abstract], [Add an abstract page.],
    [mtt-toc], [Add a table of contents.],
    [mtt-bibliography], [Add a bibliography page.],
  ),
  caption: [A table included in the thesis.],
) <example-table>


#pagebreak()

== Code and references

Code blocks are displayed by `mtt-codebox()`. For example, see how the source code of this document is printed into this PDF in @ch:code.

/*#mtt-codebox(
  caption: [Integration of the source code into this document.],
  ref: "example-code",
)[*/
#mtt-code-sample(
  caption: [Integration of the source code into this document. (See @code:simple.py)],
  ref: "code:integ",
)[
  ```typst
  #mtt-listing-figure(
    caption: [The Typst code generating this file.],
    ref: "code:simple.py"
  )[
    #codly.new(
      raw(read("simple.typ"), lang: "typst", block: true),
      file: "simple.typ",
      indent-guides: (width: 4),
      rainbow: true,
      wrap-marker: [↪],
      breakable: true,
    )
  ]
  ```
]

The bibliography uses a regular BibLaTeX file. For example, this sentence can cite a paper with @R:scipy.

== Custom appendices

Custom pages can be added to the `before` or `after` list alongside the
built-in modules. This example adds `mtt-content-frame` to `after`, so the
framed appendix appears after the bibliography and before the Typst guide.

= Code of this File <ch:code>

This section reproduces the source code used to generate this entire PDF.

#mtt-code-sample(
  caption: [The Typst code generating this file.],
  ref: "code:simple.py"
)[
  #codly.new(
    raw(read("simple.typ"), lang: "typst", block: true),
    file: "simple.typ",
    indent-guides: (width: 4),
    rainbow: true,
    wrap-marker: [↪],
    breakable: true,
  )
]

/*#mtt-codebox(
  caption: [The Typst code generating this file.],
  ref: "code:this-file",
  raw(read("simple.typ"), lang: "typ"),
)*/

//#figure(caption: [The Typst code generating this file.], raw(read("simple.typ"), lang: "typst"))
