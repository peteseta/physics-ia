#import "@preview/tablex:0.0.6": tablex, gridx, hlinex, vlinex, colspanx, rowspanx, cellx
#import "@preview/nth:0.2.0": nth

#set page(paper: "a4", numbering: "1", number-align: top + right, margin: 0.80in)
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
harmonic frequencies $f_n$ which are present in addition to the fundamental
frequency $f_1$. In addition to the fundamental variation between instruments,
the timbre also varies based on how notes are played
@tsokosPhysicsIBDiploma2014. It is qualitatively observed that plucking near the
bridge will create a harsher, “tinny” sound while plucking toward the bridge
will create a fuller sound.

This investigation will explore how the quality of sound as measured by the
output signal may change depending on where the string is plucked. The research
question I have decided to investigate is: _How does changing the position of the plectrum along a guitar's scale length
affect the frequency of the harmonic with the highest intensity when a string
with constant tension is plucked?_

== Background <background_information>
// standing waves - guitar string is a string with two fixed ends
// perov2016 paper

#figure(
  image("figures/guitar_acc.png", width: 50%),
  caption: [Standing waves on a guitar string @novakStandingWavesWhat],
) <guitar_fig>

A guitar string is a string with two fixed ends. When the string is plucked, a
transverse wave is initiated that propagates along the length of the string. The
reflection of the transverse wave at the fixed ends superimposes with the
original wave, forming nodes (points of zero displacement) and antinodes (points
of maximum displacement). This creates a standing wave, which is a wave that
does not propagate but rather oscillates in place @tsokosPhysicsIBDiploma2014.

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
emitted by a guitar string is a mixture of multiple harmonic frequencies, as in
@guitar_fig.

#figure(
  image("figures/guitar_string.png", width: 70%),
  caption: [A guitar string of length $L$ pulled a distance $A$ at position $x_1$ @perovPhysicsGuitarString2016],
) <string_pluck_fig>

To investigate how the picking length affects the harmonic with the highest
amplitude, we must determine the variation of the amplitude of each harmonic
frequency separately. The amplitude $b_n$ of the $n$th harmonic is given by the
equation
$ b_n = (2 A sin(n pi x_1 / L)) / (x_1 / L (1-x_1 / L) pi^2 n^2) $ <amplitude_eq>
where:
- $x_1$ is the picking position/distance from the nut
- $A$ is the distance the string is pulled when plucked
- $L$ is the string length

The variation in amplitude thus depends on the harmonic $n$, like so:

#figure(
  image("figures/perov_variations.png", width: 80%),
  caption: [Variation of the amplitude $b_n$ for $n=2$ through $n=5$ with the picking length $x_1/L$ (ratio
    of picking position to string length $L$) @perovPhysicsGuitarString2016],
)

By calculating $b_n$ (@amplitude_eq) for $n=2...10$ at each variation of $x_1$ and
choosing the value of $n$ that maximizes $b_n$, the non-fundamental harmonic
frequency with the highest amplitude can be calculated using @freq_integer. The
fundamental frequency $f_1$ is known to be $f_1 = 329.63 "Hz"$.

Plotting the picking length $x_1$ against the non-fundamental harmonic frequency
with the highest amplitude $f$ results in a Gaussian-like function where the #nth(2) harmonic
has the highest amplitude across picking lengths, except near the middle of the
fretboard where the #nth(3) harmonic has the highest amplitude. This is shown in
@model_fig.

#figure(
  image("figures/model_fit.png", width: 100%),
  caption: [Theoretical gaussian trend of the variation of the non-fundamental harmonic
    frequency with the highest amplitude across picking lengths $x_1$],
) <model_fig>

Therefore, it is hypothesized that the non-fundamental harmonic frequency with
the highest amplitude will remain constant across picking lengths $x_1$, except
with a peak around the middle of the fretboard ($x_1 = L/2$).

= Methodology
== Variables <variables>

*Independant Variable* \
Picking length $x_1$ (m), the distance in meters from the nut where the string
is disturbed
- $x_1$ = {0.01m, 0.08m, 0.15m, 0.22m, 0.29m, 0.36m, 0.43m, 0.50m, 0.57m, 0.64m}
- The variations are chosen to be evenly spaced across the guitar's scale length
  (the distance between the nut and the bridge), which is 0.64m.
- The IV is varied by plucking at the picking length as indicated by a tape
  measure.

*Dependant Variable* \
Frequency $f$ of the non-fundamental harmonic with the highest amplitude (Hz)
- Measured by recording the frequency $f_n$ of the $n$th harmonic that has the
  highest amplitude through FFT (Fast Fourier Transform) analysis, where $n=2...10$.
- This DV was chosen because the highest intensity harmonic has a significant
  impact on the quality/timbre of sound related as it is the most harmonic that is
  most audible.

#figure(
  kind: table,
  caption: "Controlled Variables",
  [
    #tablex(
      columns: (8em, 14em, auto),
      stroke: 0.5pt,
      inset: 10pt,
      align: center + horizon,
      repeat-header: true,
      header-rows: 1,
      [*Control*],
      [*Reason*],
      [*Specification*],
      [Diameter, tension, age, and other material properties of the string],
      [Different material properties of the string may change its harmonic composition.],
      [The same high E string tuned to the standard $E = 329.63 "Hz"$ will be used for
        all the experiments. By extension, the density will be kept constant by
        performing data collection in the same air-conditioned room (set to 23 ºC)],
      [Guitar body and electronics],
      [To minimize random error from the frequency response imparted by the pickups and
        guitar body.],
      [The neck pickup on the same guitar will be used across trials.],
      [Plectrum choice and picking technique],
      [Different plectrums and picking techniques may affect the harmonic composition.
        This also controls $A$ in @amplitude_eq.],
      [The same pick will be used across trials. The string will be plucked at a 45º
        angle to the fretboard, with the tip of the pick contacting the fretboard.],
    )
  ],
) <cv_table>

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
    - Electric guitar (6-string "Kiesel Guitars Osiris" used) with $0.009$mm gauge
      nylon electric guitar string ("D'Addario XS Nickel XSE0942 Super Light Coated
      Electric Guitar Strings" used)
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
  to @variables.

// #align(center)[#smallcaps("Processing")]
// 14. For each picking length $x_1$, calculate the average frequency $f$ with the
//   highest amplitude using a spreadsheet tool.
// + For each picking length $x_1$, calculate the average uncertainty in the
//   frequency using $Delta f = (f_"max" - f_"min")/2$.

#rect(
  fill: luma(245),
  inset: 12pt,
)[
  *Note:* In data collection, steps 8-11 were automated using a custom MATLAB
  program. The program applies a Hann window to the recorded audio data to reduce
  noise interference and computes the Fourier transform of the windowed data using
  Welch's method. The fundamental is identified by looking for peaks around the
  expected frequency, allowing for variations in tuning
  @mathworksWelchPowerSpectral2023.
]

== Safety, Ethical, and Environmental Considerations
// none? maybe just justify why new strings aren't needed
This is a relatively safe experiment. As the guitar is directly connected to the
audio interface, any voltages are low and are not likely to pose a safety risk.
There is no risk of water damage to any electronics. New strings are not
required for the experiment and no consumable materials are used, limiting this
experiment's environmental impacts.

#pagebreak()
= Analysis
== Raw Data - Time-Domain
// 1. raw from recording
// Show one graph/table of data from MATLAB and explain how the highest amplitude harmonic frequency was selected (excerpt of...) - time domain to frequency domain
// after FFT, which does bla bla bla, we get all the frequencies for trials and variations

#figure(caption: "Example of frequency-domain data showing harmonic peaks", [
  #image("figures/matlab_fft.png", width: 80%)
]) <matlab_fft_figure>

As an example, @matlab_fft_figure shows the frequency-domain data for a specific
trial and variation, which has been converted by the program from the time
series data (omitted because it cannot be represented meaningfully in text/table
form).

Each harmonic frequency is represented by a peak in the data and is marked #sym.circle H2
(#nth(2) harmonic) thorough #sym.circle H40 (#nth(40) harmonic) for clarity.

// qualitative observations
#align(center)[#smallcaps("Qualitative Observations")]
- I observed that plucking near the ends of the string created a harsher, "tinny"
  sound.
- On the other hand, plucking near the middle of the string created a fuller
  sound.
- This contrast is likely a result of a change in harmonic composition, where the
  harsher sound is a result of a reduced presence of mid frequencies, around 500Hz
  to 2000Hz, and the fuller sound is a result of a more balanced frequency
  spectrum.

#pagebreak()
== Raw Data - Frequency-Domain
// 2. after all the highest-amplitude harmonics are identified
// Show raw data table of all selected frequencies across trials and variations
// raw frequencies from FFT for all trials, for each picking length

#let uncert(n) = str(calc.round((0.05 * 329.63 * n), digits: 2))

#figure(
  kind: table,
  caption: "Raw data of highest amplitude harmonic frequencies at each plucking length",
  tablex(
    columns: 7,
    auto-vlines: false,
    inset: 10pt,
    align: center + horizon,
    repeat-header: true,
    header-rows: 2,
    rowspanx(2)[*Plucking length\ $x_1$ (m)* \ $Delta x_1 = ±0.005$m],
    colspanx(6)[*Frequency with highest amplitude\ $f$ / $Delta f$ (Hz)*],
    [Trial 1],
    [Trial 2],
    [Trial 3],
    [Trial 4],
    [Trial 5],
    [$Delta f$],
    // 0.01  655.70  655.88  655.88  655.88  655.88
    // 0.08  655.70  655.88  655.88  655.88  655.88
    // 0.15  655.88  655.88  655.88  656.07  655.88
    // 0.22  656.07  655.88  655.88  656.07  656.07
    // 0.29  984.01  983.83  984.01  984.01  984.01
    // 0.36  656.07  984.01  655.88  655.88  655.88
    // 0.43  655.88  656.07  655.88  655.88  655.88
    // 0.50  655.88  655.88  655.88  655.88  655.88
    // 0.57  656.07  655.88  655.88  655.88  655.88
    // 0.64  655.88  656.07  656.07  655.88  656.07
    [0.01],
    [655.70],
    [655.88],
    [655.88],
    [655.88],
    [655.88],
    [#uncert(2)],
    [0.08],
    [655.70],
    [655.88],
    [655.88],
    [655.88],
    [655.88],
    [#uncert(2)],
    [0.15],
    [655.88],
    [655.88],
    [655.88],
    [656.07],
    [655.88],
    [#uncert(2)],
    [0.22],
    [656.07],
    [655.88],
    [655.88],
    [656.07],
    [656.07],
    [#uncert(2)],
    [0.29],
    [984.01],
    [983.83],
    [984.01],
    [984.01],
    [984.01],
    [#uncert(3)],
    [0.36],
    [656.07],
    [#text(fill: red, "984.01") #footnote("Outlier removed for data processing")],
    [655.88],
    [655.88],
    [655.88],
    [#uncert(2)],
    [0.43],
    [655.88],
    [656.07],
    [655.88],
    [655.88],
    [655.88],
    [#uncert(2)],
    [0.50],
    [655.88],
    [655.88],
    [655.88],
    [655.88],
    [655.88],
    [#uncert(2)],
    [0.57],
    [656.07],
    [655.88],
    [655.88],
    [655.88],
    [655.88],
    [#uncert(2)],
    [0.64],
    [655.88],
    [656.07],
    [656.07],
    [655.88],
    [656.07],
    [#uncert(2)],
  ),
) <raw_data_table>
// justification of absolute uncertainties
// tape measure - ± whatever cm = ± whatever m
// frequency - ± whatever % from the search window of the FFT

#align(center)[#smallcaps("Absolute Uncertainties")]
- The absolute uncertainty in the picking length $x_1$ is $Delta x_1 = ±0.005 "m"$ as
  the tape measure has a precision of $1 "cm"$.
- The absolute uncertainty in the frequency $f$ is $ Delta f = ±n times 0.05f_1 = ±n times 16.48"Hz" $
  as the frequency search window in the FFT is $5%$ of the expected fundamental
  frequency $f_1 = 329.63"Hz"$. This uncertainty is multiplied by $n$ because it
  propagates when the non-fundamental harmonic is calculated by multiplying the
  fundamental frequency by the harmonic number $n$. For instance, plucking length $x_1 = 0.01$m
  results in the 2nd harmonic with the highest amplitude, so regardless of the
  FFT-found fundamental frequency, the absolute uncertainty is $Delta f = ±2 times 16.48 = ±32.96"Hz"$.

#pagebreak()
== Processed Data
// processed data - average frequencies across trials, for each picking length
#figure(
  kind: table,
  caption: "Raw data of highest amplitude harmonic frequencies at each plucking length",
  tablex(
    columns: 3,
    auto-vlines: false,
    inset: 10pt,
    align: center + horizon,
    repeat-header: true,
    header-rows: 2,
    [*Plucking length* \ $x_1$ (m) \ $Delta x_1 = ±0.005$m],
    [*Average frequency with highest amplitude* \ $macron(f)$ (Hz)],
    [*Uncertainty in $macron(f)$* \ $Delta macron(f)$ (Hz)],
    // 0.01  655.85  32.96
    // 0.08  655.85  32.96
    // 0.15  655.92  32.96
    // 0.22  655.99  32.96
    // 0.29  983.97  49.44
    // 0.36  655.93  32.96
    // 0.43  655.92  32.96
    // 0.50  655.88  32.96
    // 0.57  655.92  32.96
    // 0.64  655.99  32.96
    [0.01],
    [655.85],
    [32.96],
    [0.08],
    [655.85],
    [32.96],
    [0.15],
    [655.92],
    [32.96],
    [0.22],
    [655.99],
    [32.96],
    [0.29],
    [983.97],
    [49.44],
    [0.36],
    [655.93],
    [32.96],
    [0.43],
    [655.92],
    [32.96],
    [0.50],
    [655.88],
    [32.96],
    [0.57],
    [655.92],
    [32.96],
    [0.64],
    [655.99],
    [32.96],
  ),
) <processed_data_table>

#align(center)[#smallcaps("Calculations")]
// Example calculation of averaging
// Calculation of average uncertainty
// range or standard deviation of trials
- The average frequency with the highest amplitude $macron(f)$ was calculated by
  averaging the frequencies with the highest amplitude across trials, for each
  variation of the picking length $x_1$. For example, for $x_1 = 0.01 "m"$, the
  average frequency $macron(f)$ is
  $ macron(f) = 1/5 sum_(n=0)^5 (f_(x_1 = 0.01, "trial" n)) \ = 1/5 (655.70 + 655.88 + 655.88 + 655.88 + 655.88) \ = 655.85 "Hz" $
- The uncertainties are due to systematic error from the FFT process rather than
  random error between trials, therefore the absolute uncertainties are used as in
  @raw_data_table as opposed to $Delta macron(f) = (f_"max" - f_"min") / 2$. For
  instance, the absolute uncertainty for picking length $x_1 = 0.01$m is 32.96Hz,
  so $Delta macron(f) = 32.96$Hz.

#pagebreak()
== Graphical Analysis
// graph of average
#figure(
  caption: [Graph of picking length $x_1$ against average frequency $macron(f)$],
  [
    #image("figures/collected_data.png", width: 100%)
  ],
) <processed_data_figure>

// briefly comment on graph: clear peak at 0.29m
Graphing the processed data, there is a clear peak at the data point (0.29,
983.97), while every other data point has a y-value around 655Hz ± 1Hz. The
error bars are quite large, around ±30–50Hz, however, this does not impair the
clear peak at 0.29m.

// comment on error bars - quite large but still acceptable and shows the peak at 29.

The graph cannot be linearized within the scope of the IA due to requiring
Taylor series approximations @ratkowskyTaylorSeriesLinearization1975. Therefore,
the data will be compared to the theoretical simulation data, to which a
Gaussian function is fitted.

== Comparison with Theoretical Data
Using the process outlined in @background_information, the theoretical harmonic
frequency with the highest amplitude $f_"modeled"$ was calculated for each
variation of the picking length $x_1$. The collected data was then compared
against the theoretical data, as shown in @comparison_data_table and
@comparison_figure.

#figure(
  kind: table,
  caption: [Comparison between $macron(f)_"actual"$ and $f_"modeled"$],
  tablex(
    columns: 4,
    auto-vlines: false,
    inset: 10pt,
    align: center + horizon,
    repeat-header: true,
    header-rows: 2,
    [*Plucking length\ $x_1$ (m)* \ $Delta x_1 = ±0.005$m],
    [*Measured average frequency with highest amplitude* \ $macron(f)_"actual"$ (Hz)],
    [*Theoretical average frequency with highest intensity* \ $f_"modeled"$ (Hz)],
    [*Percentage difference between $macron(f)_"actual"$ and $f_"modeled"$* \ $Delta %$],
    // 0.01  655.85  659.26  -0.52%
    // 0.08  655.85  659.26  -0.52%
    // 0.15  655.92  659.26  -0.51%
    // 0.22  655.99  659.26  -0.50%
    // 0.29  983.97  988.89  -0.50%
    // 0.36  655.93  659.26  -0.51%
    // 0.43  655.92  659.26  -0.51%
    // 0.50  655.88  659.26  -0.51%
    // 0.57  655.92  659.26  -0.51%
    // 0.64  655.99  659.26  -0.50%
    [0.01],
    [655.85],
    [659.26],
    [-0.52%],
    [0.08],
    [655.85],
    [659.26],
    [-0.52%],
    [0.15],
    [655.92],
    [659.26],
    [-0.51%],
    [0.22],
    [655.99],
    [659.26],
    [-0.50%],
    [0.29],
    [983.97],
    [988.89],
    [-0.50%],
    [0.36],
    [655.93],
    [659.26],
    [-0.51%],
    [0.43],
    [655.92],
    [659.26],
    [-0.51%],
    [0.50],
    [655.88],
    [659.26],
    [-0.51%],
    [0.57],
    [655.92],
    [659.26],
    [-0.51%],
    [0.64],
    [655.99],
    [659.26],
    [-0.50%],
  ),
) <comparison_data_table>

// low % difference overall
Overall, there is a low average percentage difference between the average
frequency from the experiment and the theoretical value. The average percentage
difference is -0.51%, an acceptable error, and is within the 5% margin of error
from the FFT process

// systematic error between collected data and model data
This percentage difference is roughly constant across variations with the
measured average frequency being around 3-5Hz lower than the theoretical,
suggesting that there is a source of systematic error. This can likely be
attributed to discrepancies in tuning of the guitar string.

#figure(
  caption: [Comparison between $macron(f)_"actual"$ and $f_"modeled"$ with Gaussian
    trendline],
  [
    #image("figures/comparison.png", width: 100%)
  ],
) <comparison_figure>

= Conclusion
// The hypothesis is well-supported
The hypothesis, which stated that _the non-fundamental harmonic frequency with the highest amplitude will remain
constant across picking lengths $x_1$, except with a peak around the middle of
the fretboard_, is well-supported. There is a clear trend of constant frequency,
with a peak at the middle of length $L$ which is at $x_1 = L/2 = 0.29m$.

Notably, the error bars are quite large, with the lowest being ±32.96Hz and the
highest being ±49.44Hz

// show graph with both - show peak at same place and frequency and very good R^2 value
In comparison with the theoretical data, to which a Gaussian fit has been
applied, the peak at (0.29, 983.97) aligns, and so do the other values. This
theoretical trendline passes through every error bar of the collected data, with
an $R^2$ value of 0.9987 which indicates a strong correlation. This strongly
supports the validity of the data collected.

== Scientific Reasoning
// From the background, there are higher harmonics from the picking length
// The results show that there is a variation of higher (non-fundamental) harmonics at each picking length
// for instance, at x_1 = ... there is the highest frequency _ which is an integer multiple of the fundamental (n=_)
The results, both measured and theoretical, are supported by the scientific
background, as outlined in @background_information. The results show that there
is a variation of higher (non-fundamental) harmonics at each picking length. For
instance, at $x_1 = 0.01m$, the highest amplitude harmonic frequency is 655.85Hz
on average, which is the #nth(2) harmonic. The frequency is thus roughly $2 times f_1 = 2 times 329.63"Hz"$,
showing that the harmonic is an integer multiple of the fundamental.

// peak at x_1 = 29 might be from exciting an antinode (as the third harmonic is the strongest there)
The peak at (0.29, 983.97), which is the #nth(3) harmonic, may be explained by
an antinode on the #nth(3) harmonic loop existing at that location.

When the string is plucked at its midpoint, the central antinode of the third
harmonic is excited to its maximum extent; there will be maximum displacement
where the third harmonic has its maximum amplitude (central antinode). Compared
with the #nth(2) harmonic, which has a node at the midpoint, the #nth(3) harmonic
might be excited more because the #nth(2) harmonic's node is a position of zero
displacement.

= Evaluation
== Strengths
// Precise and accurate data overall, with only 1 outlier removed across all variations and trials
// Low standard deviation in the data
// Fractional uncertainties from measurement and averages were acceptable
Overall, the data was generally precise and accurate. This is supported by the
data in that there was only one outlier (colored in red in @raw_data_table),
which was removed when taking averages. The average standard deviation between
trials was 0.08Hz, which indicates that the data was precise. Comparing the
collected data to the theoretical data led to a low average percentage
difference and high correlation coefficient ($R^2$ value) with the theoretical
trendline, further indicating that the data was accurate.

The methodology allowed 5 trials of data to be collected for 10 variations of
the IV, which resulted in a relevant investigation. The control variables chosen
were relevant and limited random error. The method of investigation, FFT
analysis was appropriate for investigating the research question as it yielded
more consistent data than if other less discriminatory harmonic frequency
detection methods were used, such as a phone frequency detector application or a
guitar tuner.

#pagebreak()
== Limitations
// methodological issues - refer back to assumptions made in the background

// IMPORTANT: other errors/uncertainties included from the FFT process which are not considered
// source of error = searching for fundamental frequency within the 5% window which translates into offset frequencies for harmonics. This could explain the systematic error in fitting the original equation.
// introduced random error in picking by hand but precision was still high so there isn't much evidence to support this
#figure(
  kind: table,
  caption: [Limitations of the design of the experiment],
  tablex(
    columns: (auto, auto, 13em),
    stroke: 0.5pt,
    inset: 10pt,
    align: center + horizon,
    repeat-header: true,
    header-rows: 1,
    [*Source/effects of error*],
    [*Significance of error*],
    [*Possible improvements*],
    [Errors in the FFT analysis, such as the frequency search window (accounted for)
      and the resolution of the FFT (not accounted for). These errors propagate to the
      calculated harmonic frequencies, which results in both random and systematic
      errors in the calculated frequencies. This can be seen in the offset between the
      measured data points and the theoretical.],
    [Low significance. As 5 trials are performed for each variation, the random error
      is reduced, and the low standard deviation in the data suggests that this is
      only a minor source of error. However, the systematic error is more significant,
      as it is a source of error in the fitting of the theoretical trendline.],
    [The frequency search window can be reduced to reduce the random error. The
      resolution of the FFT can be increased to reduce the systematic error.],
    [The string was plucked by hand, which introduces random error in the picking
      technique. This could result in a variation in the harmonic composition of the
      string, introducing error.],
    [Medium significance. \ The high precision in the data suggested that random
      error was low, but this could have contributed to systematic error.],
    [Repeat the experiment, using a robot/mechanical plucking device to pluck the
      string with a known, consistent force.],
  ),
) <limitations_table>

assumed A in equation to be 1

#pagebreak()
== Further Study
// quickly conclude again - this RQ was answered.
// ext 1: guitar string types - nylon, copper, etc. to see if they have the same relationship
// ext 2: ?? ask chat
// last resort = exp could be repeated with ... to reduce error (but not  relevant for me cus it's alr okay)

To further explore the factors that affect tone in a guitar, other independent
variables may be explored. For instance:

- The experiment could be repeated with different types of guitar strings, such as
  nylon, copper, or steel strings, to see how each string material affects the
  harmonic composition of the sound (the non-fundamental harmonic frequency with
  the highest amplitude).\
  #sym.arrow *IV*: material/type of string\
  #sym.arrow *DV*: non-fundamental harmonic frequency with the highest amplitude

- The experiment could be repeated with different types of guitar pickups, such as
  single-coil and humbucker pickups, to see the effect of each pickup's frequency
  response, and how it affects the harmonic composition of the sound.\
  #sym.arrow *IV*: type of pickup (single-coil, humbucker, mix, active/passive
  pickups, etc.)\
  #sym.arrow *DV*: non-fundamental harmonic frequency with the highest amplitude

#bibliography("Physics IA.bib", style: "apa") <bibliography>