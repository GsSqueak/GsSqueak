plugin-testing
pluginTest  "Display restoreAfter: [(FFT new nu: 12) pluginTest]."
	"Test on an array of 256 samples"
	"Initialize to pure (co)Sine Wave, plot, transform, plot, invert and plot again"
	self realData: ((1 to: n) collect: [:i | (Float pi * (i-1) / (n/8)) cos]).
	self plot: realData in: (100@20 extent: 256@60).
	self pluginPrepareData.
	Transcript cr; print: (Time millisecondsToRun:[self pluginTransformData: true]); endEntry.
	self plot: realData in: (100@100 extent: 256@60).
	self plot: imagData in: (100@180 extent: 256@60).
	Transcript cr; print: (Time millisecondsToRun:[self pluginTransformData: false]); endEntry.
	self plot: realData in: (100@260 extent: 256@60)