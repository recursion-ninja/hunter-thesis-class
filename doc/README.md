Hunter Thesis
========================================


## LaTeX class for masters theses produced at Hunter College of Arts and Sciences

### Introduction

This repository contains the [`hunterthesis.cls`][0] LaTeX document class.
The class is a specialization of the general purpose [Clean Thesis][1] style, ([source code][2]).
One of the aims of the design goals of `hunterthesis.cls` is providing and intuative and unobtrusive LaTeX template for masters students so that their cognative focus can remain on research and writing, not typesetting.
The other, equally important design goal is compliance with the [Guidelines for Preparing Master's Theses in Arts & Sciences][3].


### Compliance

The `hunterthesis.cls` document class meets the following exhuastive list of guideline statements:

  - [X] Thesis text should be typed using a legible font such as Arial, Courier, or Times New Roman.
  - [X] All margins of both text and illustrations must be one inch.
  - [X] The text is to be double-spaced.
  - [X] Footnotes and bibliography will be single-spaced, with double spacing between notes and entries.
  - [X] All Pages, ... are to be typed or scanned and numbered consecutively in Arabic numerals.
  - [X] [Provide] an informative abstract of no more than 50 words
  - [X] [Provide] a list of ten keywords


### Getting Started

An outline of how to use the `hunterthesis.cls` document class is illistrated in the [`example`][4] directory.
There is a `Makefile` included to assist you in building the example thesis.

It is important that you specify the path to your bibliography files when declaring `hunterthesis` as the document class.
For example, to specify `references.bib` as your bibliography file, you should start your LaTeX document like so:

```
\documentclass[
bibfile=references
]{hunterthesis}
```


### Other Considerations

The `hunterthesis.cls` document class is **free software** released under the LaTeX project [public license][5].
A copy of the LaTeX project public license is included within the repostory [`doc/LICENSE`][6].


[0]: https://github.com/recursion-ninja/hunter-thesis-class/blob/master/hunterthesis.cls
[1]: http://cleanthesis.der-ric.de/
[2]: https://github.com/derric/cleanthesis
[3]: https://www.hunter.cuny.edu/artsci/graduate-education/guidelines-for-preparing-masters-theses-in-arts-sciences
[4]: https://github.com/recursion-ninja/hunter-thesis-class/tree/master/example
[5]: https://www.latex-project.org/lppl.txt
[6]: https://github.com/recursion-ninja/hunter-thesis-class/blob/master/doc/LICENSE
