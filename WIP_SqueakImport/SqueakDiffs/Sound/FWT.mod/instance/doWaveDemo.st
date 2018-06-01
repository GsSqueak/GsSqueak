testing
doWaveDemo  "FWT new doWaveDemo"
	"Printing the above should yield a small number -- I get 1.1e-32"
	| originalData |
	self nSamples: 312 nLevels: 3.
	self setAlpha: 0.0 beta: 0.0.

	"Install a sine wave as sample data"
	self samples: ((1 to: nSamples) collect: [:i | ((i-1) * 0.02 * Float pi) sin]).
	originalData := samples copy.
	FFT new plot: (samples copyFrom: 1 to: nSamples) in: (0@0 extent: nSamples@100).

	"Transform forward and plot the decomposition"
	self transformForward: true.
	transform withIndexDo:
		[:w :i |
		FFT new plot: (w copyFrom: 1 to: w size-5)
			in: (i-1\\2*320@(i+1//2*130) extent: (w size-5)@100)].

	"Test copy out and read in the transform coefficients"
	self coeffs: self coeffs.

	"Ttransform back, plot the reconstruction, and return the error figure"
	self transformForward: false.
	FFT new plot: (samples copyFrom: 1 to: nSamples) in: (320@0 extent: nSamples@100).
	^ self meanSquareError: originalData