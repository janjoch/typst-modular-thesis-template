#import "template/mtt.typ": *

#import "@preview/acrostiche:0.7.0": *

#init-acronyms((
  "MTT": ("modular thesis template", "modular Typst templates"),
  // ... add more acronyms 
))

#show: mtt-thesis.with(
  coverpage: mtt-coverpage(
    //logo-left: rect(height: 50pt)[Your university logo],
    logo-left: image("template/eth_logo_kurz_cropped.svg", height: 25pt),
    // logo-left: image("path/to/your/uni-logo.pdf", height: 50pt),
    logo-center: [],
    logo-right: rect(height: 35pt)[Your department logo],
    // logo-right: image("path/to/your/dept-logo.svg", height: 50pt),
    department: "Department of Everything",
    institute: "Institute of Nothing",
    title: [A Very Inspiring Title],
    project-type: "Bachelor Thesis",
    date: datetime.today(),
    cover-image: image("template/cover-image.svg", width: 100%),
    //cover-image: image("path/to/your/cover-image.svg", width: 100%),
    author-name: "Jane Doe",
    author-email: "janedoe@university.org",
    advisors: (
      (name: "Advisor One", email: "advisor.one@university.org"),
      (name: "Advisor Two", email: "advisor.two@university.org"),
    ),
    professors: (
      (name: "Prof. Dr. Professor", email: "professor@university.org"),
    ),
  ),
  before: (
    mtt-abstract()[
      This is a very simple one-file thesis. Enjoy! 
      
      The code that generated this file is listed in @ch:simple below.

      Additionally, there is a Typst crashcourse in @ch:quick-guide attached 
      to the end of this file.
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
    mtt-todos(),
  ),
  customisation: doc => {
    //set text(fill: red)
    //show text: set text(fill: red)

    doc
  },
)


= A Simple Example <ch:simple>

This is the place where your thesis will go. Just type everything you want to say in this file. Or outsource it to other files, it's up to you.

== Modular Appendices

The template offers many different modules, and you can insert them in any order you like. #todo[elaborate a bit more.]

#figure(
  table(
    columns: (auto, 1fr, auto),
    align: left,
    table.header([*Module*],[*Examples*],[*Notes*]),
    [Abstract], [```typ
    mtt-abstract[This is the text.]

    mtt-abstract(
      title: [Your Custom Title]
    )[
      Your abstract text.
    ]

    mtt-abstract(include "abstract.typ")
    ```],[],
    [Contents],[`mtt-toc()` \ `mtt-toc(title: [Custom Title])`],[],
    [List of Figures],[`mtt-figures()` \ `mtt-figures(title: [Custom Title])`],[],
    [List of Tables],[`mtt-tables()` \ `mtt-tables(title: [Custom Title])`],[],
    [List of Code Samples],[`mtt-codes()` \ `mtt-codes(title: [Custom Title])`],[],
    [List of Todos],[`mtt-todos()` \ `mtt-todos(title: [Custom Title])`],
      [requires #link("https://typst.app/universe/package/dashy-todo/", "dashy-todo")],
    [List of Acronyms],[`mtt-acronyms()` \ `mtt-acronyms(title: [Custom Title])`],
      [
        requires #link("https://typst.app/universe/package/acrostiche/", "acrostiche")

        init acronyms with \ `#init-acronyms()`
      ],
    [Bibliography],[
    ```typ
    mtt-bibliography(
      bibliography(
        "references.bib",
      ),
    )
    ```],[],
    [External Content Frame],[`mtt-content-frame`],[],
    [Typst Guide],[`mtt-typst-guide`],[],
    //[],[],[],
  ),
  caption: [Available modules.]
)

The modules can either be added before the main content:

#codebox(
  caption: [Modules before the main content.],
  ref: "code:modular"
)[
```typ
#import "template/mtt.typ": *

#show: mtt-thesis.with(
  // Modules here will be displayed in this order before the main content:
  before: (
    mtt-abstract[Your abstract text goes here.],
    mtt-toc(),
  ),
  // Modules here will be displayed in this order after the main content:
  after: (
    mtt-figures(),
    mtt-bibliography(bibliography("references.bib")),
  ),
)
```
]

You can also add your own pages:

#codebox(
  caption: [Custom appendices.],
  ref: "code:custom"
)[
```typ
#import "template/mtt.typ": *

#show: mtt-thesis.with(
  // ...
  after: (
    page[
      = Custom Section Title

      Your custom content.
    ],
    mtt-figures(),
    // ...
  ),
)
```
]

The complete content of the file generating this document is shown in @code:this-file below.

#figure(
  rect(width: 60%, height: 100pt, align(horizon, [Imagine a pink elephant!])),
  caption: [This a picture of an elephant.],
)


== Code of this File

#codebox(
  caption: [The Typst code generating this file.],
  ref: "code:this-file",
  raw(read("simple.typ"), lang: "typ"),
)


// Typst guide
#include "template/typst-guide.typ"