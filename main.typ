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
// #show figure: set figure.caption(position: top)
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
harmonic frequencies $f_n$, which are present in addition to the fundamental
frequency $f_1$ @tsokosPhysicsIBDiploma2014. On top of fundamental variations
between instruments, each instrument's timbre also varies based on how notes are
played, like the position of the picking plectrum along the string, the force
applied, and the angle of picking @perovPhysicsGuitarString2016. It is
qualitatively observed that plucking near the bridge will create a harsher,
“tinny” sound while plucking toward the bridge will create a fuller sound.

This investigation will explore how the quality of sound as measured by the
output signal may change depending on where the string is plucked. The research
question I have decided to investigate is: _How does changing the position of the plectrum along a guitar's fretboard affect
the frequency of the harmonic with the highest intensity when a string with
constant tension is plucked?_

== Background <background_information>
// standing waves - guitar string is a string with two fixed ends
// perov2016 paper

=== Standing Waves
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
one antinode, which results in a sound wave at the fundamental frequency $f_1$,
given by the equation $f_1 = v/(2 L)$ where $v$ is the wave speed and $L$ is the
length of the string.

The linear principle of superposition states that the net displacement of a
system subjected to multiple independent disturbances (waves, in this case) is
the algebraic sum of the displacements due to each disturbance. If $y_1(x,t)$ and $y_2(x,t)$ are
two waveforms propagating along the same string, then the net waveform $y(x,t)$ is
given by the equation $y(x,t) = y_1(x,t) + y_2(x,t)$.

Due to this principle, multiple, independent standing waves are formed on the
guitar string, which results in higher-order harmonics. Each subsequent harmonic
has a frequency that is an integer multiple of the fundamental frequency, given
by $ f_n = n f_1 $ <freq_integer>

where $n$ is the harmonic number. This is known as frequency quantization.

These individual waveforms superimpose linearly to form a composite waveform
which is the sum of all individual harmonic waveforms. As a result, the sound
emitted by a guitar string is a mixture of multiple harmonic frequencies, as in
@guitar_fig.

=== Theoretical Model <model_background>
To investigate how the picking length affects the harmonic with the highest
amplitude, we must determine the variation of the amplitude of each harmonic
frequency separately.

#figure(
  image("figures/guitar_string.png", width: 60%),
  caption: [A guitar string of length $L$ pulled a distance $A$ at position $x_1$ @perovPhysicsGuitarString2016],
) <string_pluck_fig>

The amplitude $b_n$ of the $n$th harmonic is given by the equation $ b_n = (2 A sin(n pi x_1 / L)) / (x_1 / L (1-x_1 / L) pi^2 n^2) $ <amplitude_eq>

where:
- $x_1$ is the picking position/distance from the nut
- $A$ is the distance the string is pulled when plucked
- $L$ is the length of the string @perovPhysicsGuitarString2016

The variation in amplitude thus depends on the harmonic $n$, like so:

#figure(
  image("figures/perov_variations_flat.png", width: 100%),
  caption: [Variation of the amplitude $b_n$ for $n=2$ through $n=5$ with the picking length $x_1/L$ \ (ratio
    of picking position to string length $L$) @perovPhysicsGuitarString2016],
)

By calculating $b_n$ for $n=2...10$ at each variation of $x_1$ and choosing the
value of $n$ that maximizes $b_n$, the non-fundamental harmonic frequency with
the highest amplitude can be calculated using @freq_integer. The fundamental
frequency $f_1$ of the high E string (see @variables) is taken to be $f_1 = 329.63 "Hz"$.

Plotting the picking length $x_1$ against the non-fundamental harmonic frequency
with the highest amplitude $f$ results in a Gaussian-like function where the #nth(2) harmonic
has the highest amplitude across picking lengths, except near the middle of the
fretboard where the #nth(3) harmonic has the highest amplitude.

This is shown in @model_fig, with a Gaussian trendline fitted to the data
points, in the form

$ y = A times e^(-(x - B)^2 / (C^2)) + D $

Fitting the trendline to the data points results in the following parameters:
- $A = 329.63$ representing the amplitude of the peak above the baseline. This is
  equal to the fundamental frequency $f_1$ because the peak (#nth(3) harmonic) is
  one harmonic above the baseline (#nth(2) harmonic). Recall that each subsequent
  harmonic frequency is an integer multiple of the fundamental frequency.
- $B = 0.29$ representing the picking length where the peak occurs.
- $C = 0.026$ representing the width of the peak (as chosen by the curve fitting
  algorithm).
- $D = 659.26$ representing the baseline frequency, which is the frequency of the
  #nth(2) harmonic.

resulting in the specific trendline

$ y = 329.63 times e^(-(x - 0.29)^2/(0.026^2)) + 659.26 $ <trendline>

#figure(
  image("figures/model_fit.png", width: 80%),
  caption: [Theoretical Gaussian trend of the variation of the non-fundamental harmonic
    frequency with the highest amplitude across picking lengths $x_1$],
) <model_fig>

Therefore, it is hypothesized that the non-fundamental harmonic frequency with
the highest amplitude will remain constant across picking lengths $x_1$, except
with a peak around the middle of the fretboard ($x_1 = L/2$).

= Methodology
== Variables <variables>

*Independent Variable* \
Picking length $x_1$ (m), the distance in meters from the nut where the string
is plucked/disturbed
- $x_1$ = {0.01m, 0.08m, 0.15m, 0.22m, 0.29m, 0.36m, 0.43m, 0.50m, 0.57m, 0.64m}
- The variations are chosen to be evenly spaced across the guitar's
  fretboard/scale length (the distance between the nut and the bridge), which is
  0.64m. This will allow the RQ to be investigated across the entire fretboard,
  and mirrors the methodology of #cite(<perovPhysicsGuitarString2016>, form: "prose").
- The IV is varied by plucking at the picking length as indicated by a tape
  measure.

*Dependent Variable* \
Frequency $f$ of the non-fundamental harmonic with the highest amplitude (Hz)
- Measured by recording the frequency $f_n$ of the $n$th harmonic that has the
  highest amplitude through FFT (Fast Fourier Transform) analysis, where $n=2...10$.
- This DV was chosen because the highest intensity harmonic—the harmonic that is
  most audible—has a significant impact on the quality/timbre of sound.

#pagebreak()
*Controlled Variables*
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
        all the experiments. This will also control the density of the string, as data
        collection is performed in the same room with ambient temperature 23 ºC.],
      [Guitar body and electronics],
      [To minimize random error from the frequency response imparted by the pickups and
        guitar body.],
      [The neck pickup setting on the same guitar/pickup combination will be used
        across trials.],
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
the 2nd and 3rd strings to be on the same plane as the 1st string (which is
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
+ Switch to the neck pickup on the pickup selector (most inward setting), turn all
  the knobs on the guitar to 10 (maximum position clockwise), and adjust the gain
  on the audio interface appropriately to prevent clipping of the audio signal.

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
+ Calculate the absolute amplitude $|b_n|$ for the frequency at each harmonic
+ Record the harmonic $n$ that maximizes the absolute amplitude $|b_n|$ and
  calculate its frequency $f_n$.
+ Repeat steps 5–12 four more times to complete five trials for the variation.
+ Repeat steps 5–13 for the remaining variations, modifying the picking length $x_1$ according
  to @variables.

// #align(center)[#smallcaps("Processing")]
// 14. For each picking length $x_1$, calculate the average frequency $f$ with the
//   highest amplitude using a spreadsheet tool.
// + For each picking length $x_1$, calculate the average uncertainty in the
//   frequency using $Delta f = (f_"max" - f_"min")/2$.

#rect(
  fill: luma(245),
  inset: 15pt,
  [
    *Note:* In data collection for the experiment, steps 8-12 were automated using a
    custom MATLAB program.

    #figure(caption: "Example of frequency-domain data showing harmonic peaks", [
      #image("figures/matlab_fft_old.png", width: 80%)
    ]) <matlab_fft_figure>

    As an example, @matlab_fft_figure shows an example of the resulting
    frequency-domain data (step 8), which has been converted by the program from the
    time series data using FFT (omitted because it cannot be represented
    meaningfully in text/table form). The FFT process involves applying a Hann
    window to the recorded audio data to reduce noise interference and computing the
    Fourier transform of the windowed data using Welch's method
    @mathworksWelchPowerSpectral2023.

    The fundamental is identified by looking for peaks around the expected frequency
    (step 9), allowing for variations in tuning. This window is set to 5% of the
    standard tuning value $f_1 = 329.63"Hz"$. The harmonic frequencies are then
    calculated according to @freq_integer (step 10). For illustration, each harmonic
    frequency is represented by a peak in the data and is marked #sym.circle H2 (#nth(2) harmonic)
    through #sym.circle H40 (#nth(40) harmonic) for clarity.
  ],
)

#pagebreak()
== Safety, Ethical, and Environmental Considerations
// none? maybe just justify why new strings aren't needed
This is a safe experiment. As the guitar is directly connected to the audio
interface, any voltages are low and are not likely to pose a safety risk. Water
is not used therefore water damage is not a risk. New strings are not required
and no consumable materials apart from masking tape are used, limiting the
environmental impact. There are no significant ethical considerations.

= Analysis
== Raw Data - Frequency-Domain
// 2. after all the highest-amplitude harmonics are identified
// Show raw data table of all selected frequencies across trials and variations
// raw frequencies from FFT for all trials, for each picking length

#let uncert(n) = str(calc.round((0.05 * 329.63 * n), digits: 2))

// #figure(
//   kind: table,
//   caption: "Raw data of highest amplitude harmonic frequencies at each plucking length",
//   tablex(
//     columns: 6,
//     stroke: 0.5pt,
//     inset: 10pt,
//     align: center + horizon,
//     repeat-header: true,
//     header-rows: 2,
//     rowspanx(2)[*Plucking length\ $x_1$ (m)* \ $Delta x_1 = ±0.005$m],
//     colspanx(5)[*Frequency with highest amplitude\ $f$ / $Delta f$ (Hz)*],
//     [Trial 1],
//     [Trial 2],
//     [Trial 3],
//     [Trial 4],
//     [Trial 5],
//     [0.010],
//     [655.70],
//     [655.88],
//     [655.88],
//     [655.88],
//     [655.88],
//     [0.080],
//     [655.70],
//     [655.88],
//     [655.88],
//     [655.88],
//     [655.88],
//     [0.150],
//     [655.88],
//     [655.88],
//     [655.88],
//     [656.07],
//     [655.88],
//     [0.220],
//     [656.07],
//     [655.88],
//     [655.88],
//     [656.07],
//     [656.07],
//     [0.290],
//     [984.01],
//     [983.83],
//     [984.01],
//     [984.01],
//     [984.01],
//     [0.360],
//     [656.07],
//     [#text(fill: red, "984.01") #footnote("Outlier removed for data processing")],
//     [655.88],
//     [655.88],
//     [655.88],
//     [0.430],
//     [655.88],
//     [656.07],
//     [655.88],
//     [655.88],
//     [655.88],
//     [0.500],
//     [655.88],
//     [655.88],
//     [655.88],
//     [655.88],
//     [655.88],
//     [0.570],
//     [656.07],
//     [655.88],
//     [655.88],
//     [655.88],
//     [655.88],
//     [0.640],
//     [655.88],
//     [656.07],
//     [656.07],
//     [655.88],
//     [656.07],
//   ),
// ) <raw_data_table>
#figure(
  kind: table,
  caption: "Raw data of highest amplitude harmonic frequencies at each plucking length",
  tablex(
    columns: 7,
    stroke: 0.5pt,
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
    [0.010],
    [655.70],
    [655.88],
    [655.88],
    [655.88],
    [655.88],
    [#uncert(2)],
    [0.080],
    [655.70],
    [655.88],
    [655.88],
    [655.88],
    [655.88],
    [#uncert(2)],
    [0.150],
    [655.88],
    [655.88],
    [655.88],
    [656.07],
    [655.88],
    [#uncert(2)],
    [0.220],
    [656.07],
    [655.88],
    [655.88],
    [656.07],
    [656.07],
    [#uncert(2)],
    [0.290],
    [984.01],
    [983.83],
    [984.01],
    [984.01],
    [984.01],
    [#uncert(3)],
    [0.360],
    [656.07],
    [#text(fill: red, "984.01") #footnote("Outlier removed for data processing")],
    [655.88],
    [655.88],
    [655.88],
    [#uncert(2)],
    [0.430],
    [655.88],
    [656.07],
    [655.88],
    [655.88],
    [655.88],
    [#uncert(2)],
    [0.500],
    [655.88],
    [655.88],
    [655.88],
    [655.88],
    [655.88],
    [#uncert(2)],
    [0.570],
    [656.07],
    [655.88],
    [655.88],
    [655.88],
    [655.88],
    [#uncert(2)],
    [0.640],
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

#align(center)[*#smallcaps("Qualitative Observations")*]
- It was observed that plucking near the ends of the string created a harsher, "tinny"
  sound. On the other hand, plucking near the middle of the string created a
  fuller sound.
- This contrast is likely a result of a change in harmonic composition, where the
  harsher sound is a result of a reduced presence of mid frequencies, around 500Hz
  to 2000Hz, and the fuller sound is a result of a more balanced frequency
  spectrum.

#align(center)[*#smallcaps("Absolute Uncertainties")*]
- The absolute uncertainty in the picking length $x_1$ is $Delta x_1 = ±0.005 "m"$ as
  the tape measure has a precision of $1 "cm"$.
- The absolute uncertainty $Delta f$ in the frequency $f$ is $ Delta f = ±n times 0.05f_1 = ±n times 16.48"Hz" $
  as the frequency search window in the FFT is 5% of the expected fundamental
  frequency $f_1 = 329.63"Hz"$. 5% is multiplied by $n$ because the uncertainty
  propagates when the non-fundamental harmonic is calculated using @freq_integer,
  which multiplies the fundamental frequency by the harmonic number $n$.

  For instance, plucking length $x_1 = 0.01$m results in the 2nd harmonic with the
  highest amplitude, so regardless of the FFT-found fundamental frequency, the
  absolute uncertainty is $Delta f = ±2 times 16.48 = ±32.96"Hz"$.

== Processed Data <processed_data>
// processed data - average frequencies across trials, for each picking length
#figure(
  kind: table,
  caption: "Processed data of average highest amplitude harmonic frequencies at each plucking length",
  tablex(
    columns: 3,
    stroke: 0.5pt,
    inset: 10pt,
    align: center + horizon,
    repeat-header: true,
    header-rows: 2,
    [*Plucking length* \ $x_1$ (m) \ $Delta x_1 = ±0.005$m],
    [*Average frequency with highest amplitude* \ $macron(f)$ (Hz)],
    [*Uncertainty in $macron(f)$* \ $Delta f$ (Hz)],
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

#pagebreak()
#align(center)[#smallcaps("Calculations")]
// Example calculation of averaging
// Calculation of average uncertainty
// range or standard deviation of trials
- The average frequency with the highest amplitude $macron(f)$ was calculated by
  averaging the frequencies with the highest amplitude across trials, for each
  variation of the picking length $x_1$. For example, for $x_1 = 0.01 "m"$, the
  average frequency $macron(f)$, rounded to match the original accuracy, is
  $ macron(f) = 1/5 sum_(n=0)^5 (f_(x_1 = 0.01, "trial" n)) \ = 1/5 (655.70 + 655.88 + 655.88 + 655.88 + 655.88) \ = 655.85 "Hz" $
- The uncertainties in frequency are due to systematic errors from the FFT process
  rather than random error between trials, therefore the absolute uncertainties
  are used as in @raw_data_table as opposed to $Delta macron(f) = (f_"max" - f_"min") / 2$.
  For instance, the absolute uncertainty for picking length $x_1 = 0.01$m is
  32.96Hz, so $Delta macron(f) = 32.96$Hz.

== Graphical Analysis
// graph of average
#figure(
  caption: [Graph of picking length $x_1$ against average frequency $macron(f)$],
  [
    #image("figures/collected_data.png", width: 80%)
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
the data will be compared to the theoretical simulation data.

== Comparison with Theoretical Data
As outlined in @model_background, the theoretical harmonic frequency with the
highest amplitude $f_"modeled"$ was calculated for each variation of the picking
length $x_1$. The collected data $macron(f)_"actual"$ from the experiment
(@processed_data) was then compared with the theoretical data, as shown in
@comparison_data_table and @comparison_figure.

#figure(
  kind: table,
  caption: [Comparison between $macron(f)_"actual"$ and $f_"modeled"$],
  tablex(
    columns: 4,
    stroke: 0.5pt,
    inset: 10pt,
    align: center + horizon,
    repeat-header: true,
    header-rows: 2,
    [*Plucking length\ $x_1$ (m)* \ $Delta x_1 = ±0.005$m],
    [*Measured average frequency with highest amplitude* \ $macron(f)_"actual"$ (Hz)],
    [*Theoretical frequency with highest intensity* \ $f_"modeled"$ (Hz)],
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
from the FFT process @mathworksWelchPowerSpectral2023.

// systematic error between collected data and model data
This percentage difference is roughly constant across variations with the
measured average frequency being around 3-5Hz lower than the theoretical,
suggesting that there is a source of systematic error. This can likely be
attributed to discrepancies in the tuning of the guitar string.

#figure(
  caption: [Comparison between $macron(f)_"actual"$ and $f_"modeled"$ with Gaussian
    trendline],
  [
    #image("figures/comparison.png", width: 80%)
  ],
) <comparison_figure>

Shown in @comparison_figure, plotting the theoretical Gaussian trendline
(@model_background, @trendline) on top of the experimental data results in a
coefficient of determination of $R^2_("collected") = 0.9987$, indicating a
strong "goodness of fit" between the trendline and the data.

The coefficient of determination is a measure of how well the observed outcomes
are replicated by the model, based on the proportion of total variation of
outcomes explained by the model. An $R^2$ of 0.9987 means that the trendline
accounts for 99.87% of the variance in the experimental data, indicating an
exceptionally high level of fit between the trendline and the data points.

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
background outlined in @background_information. The results show that there is a
variation of higher (non-fundamental) harmonics at each picking length. For
instance, at $x_1 = 0.01m$, the highest amplitude harmonic frequency is 655.85Hz
on average, which is the #nth(2) harmonic. The frequency is thus roughly $2 times f_1 = 2 times 329.63"Hz"$,
showing that the harmonic is an integer multiple of the fundamental.

// peak at x_1 = 29 might be from exciting an antinode (as the third harmonic is the strongest there)
The peak at (0.29, 983.97), which is the #nth(3) harmonic frequency, may be
explained by an antinode on the #nth(3) harmonic loop existing at that location.
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
Overall, the data was precise and accurate. This is supported by the data in
that there was only one outlier (colored in red in @raw_data_table), which was
removed before data processing. The average standard deviation between trials
was 0.08Hz, a value well below the degrees of uncertainty, which indicates that
the data was extremely precise. Comparing the collected data to the theoretical
data led to a low average percentage difference of -0.51% and high coefficient
of determination ($R^2 = 0.9987$) with the theoretical trendline, further
indicating that the data was accurate.

The methodology allowed 5 trials of data to be collected for 10 variations of
the IV, which resulted in a relevant investigation. The control variables chosen
were relevant and limited random/systematic error. The method of investigation,
FFT analysis, was appropriate for investigating the research question as it
yielded more precise data than if other less discriminatory harmonic frequency
detection methods were used, such as a phone frequency detector application or a
guitar tuner. The use of an automatic search algorithm to identify the
frequencies as opposed to manual identification also increased accuracy, leading
to less systematic and random error.

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
    columns: (auto, auto, auto),
    stroke: 0.5pt,
    inset: 8pt,
    align: center + horizon,
    repeat-header: true,
    header-rows: 1,
    [*Source/effects of error*],
    [*Significance of error*],
    [*Possible improvements*],
    [Errors in the FFT analysis, such as the frequency search window and the
      resolution of the FFT (not accounted for). These uncertainties propagate to the
      calculated harmonic frequencies, resulting in both random and systematic errors
      in the calculated frequencies. This can be seen in the offset (systematic error)
      between the measured data points and the theoretical.],
    [Medium significance. \ As 5 trials are performed for each variation, the random
      error is reduced, and the low standard deviation in the data suggests that this
      is only a minor source of error. \ However, the systematic error (shown by the $-3–5 "Hz"$ offset)
      is more significant.],
    [The frequency search window can be reduced to reduce the random error. The
      resolution of the FFT can be increased to reduce the systematic error.],
    [The string was plucked by hand, which introduces random error in the picking
      technique. This could result in a variation in the harmonic composition of the
      string, introducing random or systematic error.],
    [Medium significance. \ The high precision (indicated by the low standard
      deviation of 0.08Hz) in the data suggested that random error was low, but this
      could have been masked by frequency quantization.],
    [Repeat the experiment, using a robot/mechanical plucking device to pluck the
      string with a known, consistent force.],
    [The theoretical value may not be accurate due to assumptions made, such as
      assuming $A$ (the distance the string is pulled when plucking) to be 1. This
      could have introduced systematic error.],
    [Low significance. \ The theoretical value is only used to compare with the
      collected data and the low average percentage difference suggest that this is
      not a significant source of error.],
    [Controlling A in experimental data collection would forego this assumption, and
      could be achieved by using a mechanical plucking device as previously described.],
  ),
) <limitations_table>

== Further Study
// quickly conclude again - this RQ was answered.
// ext 1: guitar string types - nylon, copper, etc. to see if they have the same relationship
// ext 2: ?? ask chat
// last resort = exp could be repeated with ... to reduce error (but not  relevant for me cus it's alr okay)

To further explore the factors that affect a guitar's tone or harmonic
composition, other IVs may be explored:

#figure(
  caption: "Possible extensions to the investigation",
  kind: table,
  tablex(
    columns: (auto, 3em, auto, 3.5em, auto),
    stroke: 0.5pt,
    inset: 10pt,
    align: horizon,
    rowspanx(3)[*1*],
    colspanx(
      4,
    )[The experiment could be repeated with different types of guitar strings, such as
      nylon, copper, or steel strings, to see how each string material affects the
      harmonic composition of the sound (the non-fundamental harmonic frequency with
      the highest amplitude).],
    [*IV*],
    [material/type of string],
    [*DV*],
    [the non-fundamental harmonic frequency with the highest amplitude],
    colspanx(
      4,
    )[Because different materials have varying densities, tensile strengths, and
      elasticities, it can be expected that:
      - Nylon strings, which have lower density and tension, will produce a warmer and
        mellower sound resulting in lower frequency harmonics being more prominent.
      - Copper-wound strings, which have higher density and tension, will produce a
        brighter and richer sound resulting in higher frequency harmonics being more
        prominent.
      - Steel strings, which have the highest density and tension, will produce a bright
        and crisp sound resulting in even higher frequency harmonics being more
        prominent.
    ],
    rowspanx(3)[*2*],
    colspanx(
      4,
    )[The experiment could be repeated with different types of guitar pickups, such as
      single-coil and humbucker pickups, to see the effect of each pickup's frequency
      response, and how it affects the harmonic composition of the sound.],
    [*IV*],
    [type of pickup (single-coil, humbucker, mix, active/passive pickups, etc.)],
    [*DV*],
    [the non-fundamental harmonic frequency with the highest amplitude],
    colspanx(
      4,
    )[Because pickups impart a frequency response on the output signal, it can be
      expected that:
      - Single-coil pickups, which tend to accentuate higher frequencies, might result
        in the amplification of higher frequency non-fundamental harmonics.
      - Humbucker pickups, which are designed to reduce hum and noise, might result in a
        lower frequency non-fundamental harmonic being the most prominent as humbuckers
        could dampen the higher frequency harmonics to some extent.
    ],
  ),
)

#pagebreak()
#bibliography("Physics IA.bib", style: "apa", title: "References") <bibliography>