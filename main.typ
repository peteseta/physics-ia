#import "@preview/tablex:0.0.6": tablex, gridx, hlinex, vlinex, colspanx, rowspanx
#import "@preview/nth:0.2.0": nth

// apa bibliography
#import "packages/apa-bibliography/0.0.1/lib.typ": *

#let (
  reference: r,
  reference-with-page: rp,
  reference-date-only: rd,
  bibliography,
) = apa-bibliography(yaml("works.yml"))

#set page(paper: "a4", numbering: "1", number-align: top + right, margin: 1.00in)
#show heading: set block(above: 2em, below: 1em)
#show heading: set text()
#set par(
  // justify: true,
  // first-line-indent: 1em,
  leading: 1.3em,
  linebreaks: "optimized",
)
#set block(spacing: 2em)
#show figure: set block(spacing: 2.5em)

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
which is a wave that does not propagate but rather oscillates in place #r.tsokos.

The first harmonic is a standing wave with a single loop made of two nodes and
one antinode, which results in a sound wave at the fundamental frequency, given
by the equation $f_1 = v/(2 L)$.

The linear principle of superposition states that the net displacement of a
system subjected to multiple independent disturbances (waves, in this case) is
the algebraic sum of the displacements due to each disturbance. If $y_1(x,t)$ and $y_2(x,t)$ are
two waveforms propagating along the same string, then the net waveform $y(x,t)$ is
given by the equation
$ y(x,t) = y_1(x,t) + y_2(x,t) $

Due to this principle, multiple, independent standing waves are formed on the
guitar string, which results in higher-order harmonics. Each subsequent harmonic
is an integer multiple of the fundamental frequency (known as frequency
quantization), given by $ f_n = n f_1 $ <freq_integer>

These individual waveforms superimpose linearly to form a composite waveform
which is the sum of all individual harmonic waveforms. As a result, the sound
emitted by a guitar string is a mixture of multiple harmonic frequencies.

To investigate how the picking length affects the harmonic with the highest
amplitude, we must determine the variation of the amplitude of each harmonic
frequency separately. The amplitude $b_n$ of the $n$th harmonic is given by the
equation
$ b_n = (2 A sin(n pi x_1 / L)) / (x_1 / L (1-x_1 / L) pi^2 n^2) $ <amplitude_eq>
where $A$ is the distance the string is pulled when plucked and $L$ is the
string length #r.perov.

By calculating $b_n$ (@amplitude_eq) for $n=2...10$ at each variation of $x_1$ and
choosing the value of $n$ that maximizes $b_n$, the non-fundamental harmonic
frequency with the highest amplitude can be calculated using @freq_integer.

Plotting the picking length $x_1$ against the non-fundamental harmonic frequency
with the highest amplitude $f$ results in a Gaussian-like function where the #nth(2) harmonic
has the highest amplitude across picking lengths, except near the middle of the
fretboard where the #nth(3) harmonic has the highest amplitude.

Therefore, it is hypothesized that the non-fundamental harmonic frequency with
the highest amplitude will remain constant across picking lengths $x_1$, except
with a peak around the middle of the fretboard ($x_1 = L/2$).

#pagebreak()
= Methodology

== Variables
// table of variables

#figure(
  kind: table,
  caption: "Variables",
  [
    #tablex(
      columns: (7em, 13em, auto),
      auto-vlines: false,
      inset: 10pt,
      align: center + horizon,
      repeat-header: true,
      header-rows: 1,
      [*Type*],
      // vlinex(),
      [*Variable*],
      [*Specification*],
      [Independant \ Variable],
      [Picking length $x_1$ (m), the distance in meters from the nut where the string
        is disturbed],
      [$x_1$ = {0.01m, 0.08m, 0.15m, 0.22m, 0.29m, 0.36m, 0.43m, 0.50m, 0.57m, 0.64m},
        varied by plucking at the picking length as indicated by a tape measure],
      [Dependant \ Variable],
      [Frequency $f$ of the non-fundamental harmonic with the highest amplitude (Hz)],
      [Measured by recording the frequency $f_n$ of the $n$th harmonic that has the
        highest amplitude through FFT (Fast Fourier Transform) analysis, where $n=2...10$],
      rowspanx(3)[Controlled \ Variable],
      [Diameter, tension, age, and other material properties of the string],
      [The same high E string tuned to the standard $E = 329.63 "Hz"$ will be used for
        all the experiments because different material properties may change the
        harmonic composition. By extension, the density will be kept constant by
        performing data collection in the same air-conditioned room (set to 23 ºC)],
      [Guitar body and electronics],
      [The neck pickup on the same guitar will be used across trials to minimize random
        error from the frequency response imparted by the pickups and guitar body.],
      [Plectrum choice and picking technique],
      [The same pick will be used across trials. The string will be plucked at a 45º
        angle to the fretboard, with the tip of the pick contacting the fretboard. This
        controls the variable $A$ in @amplitude_eq, leaving just $x_1$ the independent
        variable.],
    )
  ],
) <variables_table>

// === Pilot Study
// perov2016 paper influence methodology
// range of IV - picking across the entire length x_1
// range of DV - only certain harmonics were shown, so higher harmonics (n>10 were likely irrelevant or could not be measured)
// CVs - mention a few controls they used

== Apparatus & Experimental Setup
// equipment list
#box(
  height: 161pt,
  columns(
    2,
    gutter: 4pt,
  )[
    - Electric guitar (6-string _Kiesel Guitars "Osiris"_ model used)
    - 1 set of $0.009 - 0.042$mm gauge nylon electric guitar strings (_D'Addario XS
      Nickel XSE0942 Super Light Coated Electric Guitar Strings_ model used)
    - 1 audio interface with instrument input (_Audient EVO4_ used)
    - 1 instrument cable
    - 1 Computer with audio analysis and spreadsheet software (_MATLAB_ and _Google Sheets_ used)
    - 1 tape measure
    - 1 clamp stand
    - Masking tape
  ],
)

// labeled photo of experimental setup
@setup_figure presents the experimental setup used to collect data. The guitar
is clamped down for ease of plucking, and the tape measure is placed directly on
the 2nd and 3rd strings to be on the same axis as the 1st string (which is
plucked).

#figure(caption: "Labeled photograph of experimental setup", [
  #image("figures/experimental_setup.png", width: 80%)
]) <setup_figure>

== Experimental Procedure
// step-by-step method

#align(center)[#smallcaps("Preparation")]
1. Clamp the guitar's head using the clamp stand to hold it in place.
+ Lay the tape measure out along the fretboard on top of the 2nd and 3rd strings,
  securing it in place with the clamp stand and masking tape.
+ Connect the guitar to the audio interface using the instrument cable, and
  connect the audio interface to the computer.
+ Turn all knobs on the guitar to 10 (maximum position clockwise) and adjust the
  gain on the audio interface appropriately to prevent clipping of the audio
  signal.

#align(center)[#smallcaps("Recording and analysis")]
5. Start the 5-second recording on the computer.
+ At the first variation of $x_1$, pluck the 1st string using the pick at a 45º
  angle to the fretboard, touching the pick to the fretboard and pushing towards
  the string perpendicularly.
+ Wait for the recording period to end and ensure the data is saved.
+ Using the frequency analysis software, convert the time-domain data into
  frequency-domain data.
+ Identify the true fundamental frequency by searching for a peak in the data
  within 5% of the expected fundamental frequency $f_1 = 329.63 "Hz"$
+ Calculate the frequency of each non-fundamental harmonic $n$ for $n=2...10$
+ Calculate the absolute amplitude $|b_n|$ for the frequency at each harmonic,
  recording the frequency $f_n$ that maximizes the absolute amplitude $|b_n|$.
+ Repeat steps 5–11 four more times to complete five trials for the variation.
+ Repeat steps 5–12 for the remaining variations, modifying the picking length $x_1$ according
  to @variables_table.

#align(center)[#smallcaps("Processing")]
1. For each picking length $x_1$, calculate the average frequency $f$ with the
  highest amplitude using a spreadsheet tool.
+ For each picking length $x_1$, calculate the average uncertainty in the
  frequency using $Delta f = (f_"max" - f_"min")/2$.

#rect(
  fill: luma(245),
  inset: 12pt,
)[
  In data collection, steps 8-11 were automated using a custom MATLAB (scientific
  programming platform) program. The program applies a Hann window to the recorded
  audio data to reduce noise interference and computes the Fourier transform of
  the windowed data using Welch's method. The fundamental is identified by looking
  for peaks around the expected frequency, allowing for variations in tuning.
]
// explain how data was collected from

== Safety, Ethical, and Environmental Considerations
// none? maybe just justify why new strings aren't needed
There are no major considerations necessary for this experiment; it is
relatively safe. As the guitar is directly connected to the audio interface, any
voltages are low and are not likely to pose a safety risk. There is no risk of
water damage to any electronics. New strings are not required for the experiment
and no consumable materials are used, limiting this experiment's environmental
impacts.

= Analysis

== Raw Data
// 1. raw from recording
// Show one graph/table of data from MATLAB and explain how the highest amplitude harmonic frequency was selected (excerpt of...) - time domain to frequency domain

// 2. after FFT, which does bla bla bla, we get all the frequencies for trials and variations
// Show raw data table of all selected frequencies across trials and variations
// raw frequencies from FFT for all trials, for each picking length

// justification of absolute uncertainties
// tape measure - ± whatever cm = ± whatever m
// frequency - ± whatever % from the search window of the FFT

// qualitative observations

== Processed Data
// processed data - average frequencies across trials, for each picking length

// Example calculation of averaging

=== Uncertainties
// average uncertainty
// range or standard deviation of trials

== Graphical Analysis
// graph of average

// briefly comment on graph: clear peak at 0.29m

= Conclusion
// The hypothesis is well-supported
// low % difference overall

// show graph with both - show peak at same place and frequency and very good R^2 value

== Scientific Reasoning
// From the background, there are higher harmonics from the picking length
// The results show that there is a variation of higher (non-fundamental) harmonics at each picking length
// for instance, at x_1 = ... there is the highest frequency _ which is an integer multiple of the fundamental (n=_)
// peak at x_1 = 29 might be from exciting an antinode (as the third harmonic is the strongest there)

// Plucking at the Midpoint: When you pluck the string at its midpoint, you're exciting the central antinode of the third harmonic to its maximum extent. This is because you're causing the maximum displacement right where the third harmonic has its maximum amplitude (central antinode). This results in a particularly strong excitation of the third harmonic.

// Other Harmonics: While plucking at the midpoint does have implications for other harmonics (like the second), the shape of the initial displacement most closely resembles the third harmonic. Hence, while other harmonics are indeed excited, the third harmonic dominates in amplitude.

// Comparison with Second Harmonic: As mentioned earlier, the second harmonic has a node at the midpoint, which means if you were to pluck right at $x_1 = L/2$ you'd be at a position of zero displacement for this harmonic. So, while the second harmonic is still excited due to the overall motion of the string, its amplitude will be comparatively smaller than the third harmonic.

= Evaluation
== Strengths
// Precise and accurate data overall, with only 1 outlier removed across all variations and trials
// Low standard deviation in the data
// Fractional uncertainties from measurement and averages were acceptable
// controlled variables were relevant and chosen well

== Limitations
// methodological issues - refer back to assumptions made in the background

// IMPORTANT: other errors/uncertainties included from the FFT process which are not considered
// source of error = searching for fundamental frequency within the 5% window which translates into offset frequencies for harmonics. This could explain the systematic error in fitting the original equation.
// introduced random error in picking by hand but precision was still high so there isn't much evidence to support this

== Further Study
// quickly conclude again - this RQ was answered.
// ext 1: guitar string types - nylon, copper, etc. to see if they have the same relationship
// ext 2: ?? ask chat
// last resort = exp could be repeated with ... to reduce error (but not  relevant for me cus it's alr okay)

// ---------- bibliography ------------
#pagebreak()
#heading(numbering: none)[References]
#bibliography <bibliography>