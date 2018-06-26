pixel copies
copyPixelsRGBA: y
	"Handle non-interlaced RGBA color modes (colorType = 6)"

	| pixel tempForm tempBits |
	tempForm := Form extent: width@1 depth: 32.
	tempBits := tempForm bits.
	pixel := 0.

	1 to: width do: [ :x | | i |
			i := x*4 -3.
			pixel := (thisScanline at: i+3) << 24.
			pixel := pixel bitOr: ((thisScanline at: i) << 16).
			pixel := pixel bitOr: ((thisScanline at: i+1) << 8).
			pixel := pixel bitOr: (thisScanline at: i+2).
			tempBits at: x put: pixel.
	].
	tempForm displayOn: form at: 0@y rule: Form over.
