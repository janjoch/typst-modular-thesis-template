# MTT – Modular Thesis Template

MTT is a modular thesis layout for Typst. It provides a configurable cover page and reusable pages for abstracts, contents, figures, tables, code samples, todos, acronyms, bibliographies, and appendices.

## Usage

Import the package and apply `mtt-thesis` as a show rule:

```typ
#import "@preview/mtt-thesis:0.1.1": *

#show: mtt-thesis.with(
  coverpage: mtt-coverpage(
    logo-center: image("assets/eth_logo_kurz_cropped.svg", height: 25pt),
    org-units: ("Department of Everything",),
    title: [A Very Inspiring Title],
    cover-image: image("assets/cover-image.svg"),
    project-type: "Bachelor Thesis",
    authors: ((name: "Jane Doe", email: "janedoe@university.org"),),
  ),
  before: (
    mtt-abstract[This is the abstract.],
    mtt-toc(),
  ),
  after: (
    mtt-figures(),
    mtt-tables(),
  ),
)

= Introduction

Your thesis starts here.

#figure(
  image("assets/cover-image.svg"),
  caption: [A figure, which is automatically included in the List of Figures.]
)

#figure(
  table(
    columns: (auto, auto),
    [One], [Two],
    [Three], [Four],
  ),
  caption: [A table, which is automatically included in the List of Tables.]
)
```

This example renders to [examples/simple.pdf](examples/simple.pdf). More examples are available in the [examples](examples) folder.

## Modules

- `mtt-thesis`: Apply the thesis layout, configure margins and localization, and insert content before and after the main body.
- `mtt-coverpage`: Create a cover page with logos, organizational units, title, authors, advisors, professors, project type, date, and cover image.
- `mtt-abstract`: Add an abstract page.
- `mtt-toc`: Add a table of contents.
- `mtt-figures`: Add a list of figures for a figure kind.
- `mtt-tables`: Add a list of tables.
- `mtt-codes`: Add a list of code samples.
- `mtt-todos`: Add a list of todos.
- `mtt-acronyms`: Add an acronym index. This requires [`acrostiche`](https://typst.app/universe/package/acrostiche/).
- `mtt-bibliography`: Add a bibliography page.
- `mtt-content-frame`: Add a framed appendix page.
- `mtt-typst-guide`: Add the included Typst guide.
- `mtt-placeholder`: Display a task-style placeholder with an optional explanation and usage snippet.
- `mtt-breakable-figure`: Display a figure or table in a breakable block.
- `mtt-code-sample`: Display a breakable code listing with a code-sample caption.

`mtt-figures`, `mtt-tables`, `mtt-codes`, and `mtt-todos` accept an optional `title` argument. `mtt-figures` also accepts a `kind` argument when a custom figure kind is needed.

## Examples

The [examples](examples/) folder contains several examples:

- [simple.typ](examples/simple.typ), as seen at the top of this readme &rarr; [PDF](examples/simple.pdf)
- [detailed.typ](examples/detailed.typ), combining this template with other useful packages and external files (such as a bibliography) &rarr; [PDF](examples/detailed.pdf)

![Example Cover Page](thumbnail.png)

## Dependencies

The package uses these Typst Universe packages:

- [`dashy-todo`](https://typst.app/universe/package/dashy-todo/) for todo markers and the todo list.
- [`acrostiche`](https://typst.app/universe/package/acrostiche/) for acronym indexes.
- [`gentle-clues`](https://typst.app/universe/package/gentle-clues/) for instructional placeholders and code blocks.

## License

Apache-2.0. See [`LICENSE`](LICENSE).

The ETH Zürich logo (`template/eth_logo_kurz_cropped.svg`) is a trademark of ETH Zürich and is not covered by the Apache-2.0 license. It is reproduced as publicly available on [Wikimedia Commons](https://commons.wikimedia.org/wiki/File:ETH_Z%C3%BCrich_Logo_black.svg).
Users must comply with [ETH Zürich's branding guidelines](https://ethz.ch/staffnet/en/service/communication/corporate-design/eth-logo.html).
