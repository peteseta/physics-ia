// apa bibliography
#import "packages/apa-bibliography/0.0.1/lib.typ":*

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
#show figure: set block(spacing: 2.5em)
// #show figure: it =>set text()

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

In guitar, tone control is a major technical skill. Each musical instrument's
quality of sound—its timbre—is differentiated by the varying composition of
harmonic frequencies ($f_n = n f_1 "for" n=1,2,3...$), which are present in
addition to the fundamental frequency $f_1$. In addition to the fundamental
variation between instruments, the timbre also varies based on how notes are
played #r.perov. It is qualitatively observed that plucking near the bridge will
create a harsher, “tinny” sound while plucking toward the bridge will create a
fuller sound.

This investigation will explore how the quality of sound may change depending on
where the string is plucked. The research question I have decided to investigate
is: _How does changing the position of the plectrum along a guitar scale affect the
frequency of the harmonic with the highest intensity when a string with constant
tension is plucked?_

== Background
// standing waves - guitar string is a string with two fixed ends
// perov2016 paper

#figure(
  image("figures/guitar_string.png", width: 70%),
  caption: [A guitar string of length $L$ pulled a distance $A$ at position $x_1$],
) <string_pluck_fig>

A guitar string is a string with two fixed ends. When the string is plucked (as
in @string_pluck_fig), a transverse wave is initiated that propagates along the
length of the string. The reflection of the transverse wave at the fixed ends
superimposes with the original wave, forming nodes (points of zero displacement)
and antinodes (points of maximum displacement). This creates a standing wave,
which is a wave that does not propagate but rather oscillates in place.

The first harmonic is a standing wave with a single loop made of two nodes and
one antinode, which results in a sound wave at the fundamental frequency, given
by the equation $f_1 = v/(2 L)$.

The linear principle of superposition states that the net displacement of a
system subjected to multiple independent disturbances (waves, in this case) is
the algebraic sum of the displacements due to each disturbance. If $y_1(x,t)$ and $y_2(x,t)$ are
two waveforms propagrating along the same string, then the net waveform $y(x,t)$ is
given by equation $ y(x,t) = y_1(x,t) + y_2(x,t) $

Due to this principle, multiple, independent standing waves are formed on the
guitar string, which results in higher-order harmonics. Each subsequent harmonic
is an integer multiple of the fundamental frequency, given by
$f_n = v / lambda_n$ where $lambda_n = (2 L) / n$. This is known as frequency
quantization.

These individual waveforms superimpose linearly to form a composite waveform
which is the sum of all individual harmonic waveforms. As a result, the sound
emitted by a guitar string is a mixture of multiple harmonic frequencies.

To investigate how the picking length affects the harmonic with the highest
amplitude, we must determine the variation of the amplitude of each harmonic
frequency separately. The amplitude $b_n$ of the $n$th harmonic is given by the
equation
$ b_n = (2 A sin(n pi x_1 / L)) / (x_1 / L (1-x_1 / L) pi^2 n^2) $ <amplitude_eq>
#r.perov

== Hypothesis
// carry on from Background, show Desmos simulation
// describe expected trend

Calculating $b_n$ (defined in @amplitude_eq) for each $n=0...20$ in the
background, it is hypothesized that

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
  #image("figures/experimental_setup.png", width: 100%)
]) <setup_figure>

== Experimental Procedure
// step-by-step method

// explain how data was collected from

== Safety, Ethical, and Environmental Considerations
// none? maybe just justify why new strings aren't needed

= Analysis

== Raw Data and Observations

=== Raw Data
// raw data - raw frequencies from FFT for all trials, for each picking length
// justification of absolute uncertainties

// show one graph/table of data from MATLAB and explain how the highest amplitude harmonic frequency was selected
// show raw data table of all selected frequencies across trials and variations

=== Observations
// qualitative observations

=== Fourier Analysis

== Processed Data
// processed data - average frequencies across trials, for each picking length

== Calculations and Uncertainty
// averages + average uncertainty

// range or standard deviation of trials

== Graphical Analysis

= Conclusion
// the hypothesis is well supported
// low % difference overall
// peak at same place and frequency
// R^2 value from Desmos

== Scientific Reasoning
// from background, there are higher harmonics from the picking length
// the results show that there is a variation of higher (non-fundamental) harmonics at each picking length
// for instance, at x_1 = ... there is the highest frequency _ which is an integer multiple of the fundamental (n=_)

= Evaluation

== Strengths

== Limitations
// methodological issues - refer back to assumptions made in the background
// other errors/uncertainties included from the FFT process which are not considered
// source of error = searching for fundamental frequency within the 5% window
// random error in picking by hand

== Further Study
// guitar string types - nylon, copper, etc. see if has the same relationship

// ---------- bibliography ------------
#pagebreak()
#heading(numbering: none)[References]
#bibliography <bibliography>