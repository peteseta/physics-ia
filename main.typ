// apa bibliography
#import "@local/apa-bibliography:0.0.1":*
#let (
  reference: r,
  reference-with-page: rp,
  reference-date-only: rd,
  bibliography,
) = apa-bibliography(yaml("works.yml"))

#set page(paper: "a4", numbering: "1", number-align: top + right, margin: 1.00in)
#show heading: set block(above: 2em, below: 1em)
#set par(
  // justify: true,
  // first-line-indent: 1em,
  leading: 1.3em,
  linebreaks: "optimized",
)

#set block(spacing: 2em)

#set heading(numbering: "1.1 ")
#set math.equation(numbering: "(1)")
#set text(font: "New Computer Modern", lang: "en")
// #set text(font: "MLMRoman12", lang: "en")

= Introduction
// Describe and explain why this is scientifically interesting
// - How is it related to daily life?
// - What would be the advantages of understanding this?

// Past researchers
// - Different methodology? Different range? Mixed result?
// - Show their graphs and/or formula

Each musical instrument's quality of sound—its timbre—is differentiated by the
varying composition of harmonic frequencies ($f_n = n f_1 "for" n=1,2,3...$),
which are present in addition to the fundamental frequency $f_1$. In addition to
the fundamental variation between instruments, the timbre also varies based on
how notes are played #r.perov.

Likewise, this has been my experience as a guitarist. Tone control is a major
technical skill. Different compositions of harmonic overtones separate each
musical instrument's sound from each other, and these harmonic overtones depend
on where the string is plucked; plucking near the bridge will create a harsher,
“tinny” sound while plucking toward the bridge will create a fuller sound.

== Research Question
This investigation will explore how the quality of sound may change depending on
where the string is plucked. The research question I have decided to investigate
is: _How does changing the position of the plectrum along a guitar scale affect the
frequency of the harmonic with the highest intensity when a string with constant
tension is plucked?_

== Background
// standing waves - guitar string is a string with two fixed ends
// perov2016 paper

#figure(
  image("guitar_string.png", width: 70%),
  caption: "A guitar string with two fixed ends",
)

A guitar string acts as a string with two fixed ends, where standing waves are
generated as a string is plucked. Harmonics exist on the guitar string, however,
the relationship between the intensity of each harmonic frequency is related to
the quality of the sound. This investigation will look at how the frequency of
the strongest harmonic (not the fundamental) changes as the position of plucking
changes.

$ sum_(n=0)^100 (lim_(x->n) x^2 + 2x + 1) $ <main_eq>

== Hypothesis
// carry on from Background, show Desmos simulation
According to @main_eq in the background, it is hypothesized that

= Methodology

== Variables
// table of variables

#figure(caption: "Variables", [
  #table(
    columns: (auto, auto, auto),
    inset: 10pt,
    align: horizon,
    [],
    [*Area*],
    [*Parameters*],
    "test",
    $ pi h (D^2 - d^2) / 4 $,
    [
      $h$: height \
      $D$: outer radius \
      $d$: inner radius
    ],
    "test",
    $ sqrt(2) / 12 a^3 $,
    [$a$: edge length],
  )
])

=== Pilot Study
// perov2016 paper influence methodology
// range of IV - picking across the entire length x_1
// range of DV - only certain harmonics were shown, so higher harmonics (n>10 were likely irrelevant or could not be measured)
// CVs - mention a few controls they used

== Apparatus & Experimental Setup
// equipment list
// labeled photo of experimental setup

- 6 stringed electric guitar (customized 6 string _Kiesel Guitars "Osiris"_ model
  used)
- 1 set of $0.009 - 0.042$mm gauge nylon electric guitar strings (_D'Addario XS
  Nickel "XSE0942 Super Light Coated Electric Guitar Strings"_ model used)
- 1 audio interface with instrument input (_Audient EVO4_ used)
- 1 instrument cable
- Computer with audio analysis software (_MATLAB_ used)
- Tape measure
- Clamp stand

@setup_figure presents the experimental setup used to collect data. The guitar
is clamped down for ease of plucking, and the tape measure is placed directly on
the 2nd and 3rd strings to be on the same axis as the 1st string (which is
plucked).

#figure(caption: "Experimental setup", [
  #image("experimental_setup.png", width: 100%)
]) <setup_figure>

== Experimental Procedure
// step-by-step method

== Safety, Ethical, and Environmental Considerations
// none? maybe just justify why new strings aren't needed

= Analysis

== Raw Data and Observations

=== Raw Data
// raw data - raw frequencies from FFT for all trials, for each picking length
// justification of absolute uncertainties

=== Observations
// qualitative observations

=== Fourier Analysis

== Processed Data
// processed data - average frequencies across trials, for each picking length

== Calculations and Uncertainty
// averages + average uncertainty

== Graphical Analysis

= Conclusion

== Scientific Reasoning

= Evaluation

== Strengths

== Limitations
// methodological issues - refer back to assumptions made in the background

== Further Study

// ---------- bibliography ------------
#pagebreak()
#heading(numbering: none)[References]
#bibliography <bibliography>