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
