testing
test  "Display restoreAfter: [(FFT new nu: 8) test].  --  Test on an array of 256 samples"
	"Initialize to pure (co)Sine Wave, plot, transform, plot, invert and plot again"
	self realData: ((1 to: n) collect: [:i | (Float pi * (i-1) / (n/8)) cos]).
	self plot: realData in: (100@20 extent: 256@60).
	self transformForward: true.
	self plot: realData in: (100@100 extent: 256@60).
	self plot: imagData in: (100@180 extent: 256@60).
	self transformForward: false.
	self plot: realData in: (100@260 extent: 256@60)