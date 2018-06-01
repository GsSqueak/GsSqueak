testing
viewPhiAndPsi  "(FWT new nSamples: 256 nLevels: 6) viewPhiAndPsi"
	"View the scaling function and mother wavelets for this transform"
	| p |
	Display fillWhite: (0@0 extent: 300@300).
	Display border: (0@0 extent: 300@300) width: 2.
	[Sensor anyButtonPressed] whileFalse:
		["Move mouse around in the outer rectangle to explore"
		p := Sensor cursorPoint min: 300@300.
		self setAlpha: (p x - 150) / 150.0 * Float pi
				beta: (p y - 150) / 150.0 * Float pi.
		'alpha=', (alpha printShowingMaxDecimalPlaces: 2), '   ',
			'beta=', (beta printShowingMaxDecimalPlaces: 2), '    ' displayAt: 50@5.
		transform do: [:w | w atAllPut: 0.0].
		(transform at: transform size - 1) at: (nSamples>>nLevels) put: 1.0.
		self transformForward: false.
		FFT new plot: (samples copyFrom: 1 to: nSamples) in: (20@30 extent: nSamples@100).

		transform do: [:w | w atAllPut: 0.0].
		(transform at: transform size) at: (nSamples>>nLevels) put: 1.0.
		self transformForward: false.
		FFT new plot: (samples copyFrom: 1 to: nSamples) in: (20@170 extent: nSamples@100)].
	Sensor waitNoButton