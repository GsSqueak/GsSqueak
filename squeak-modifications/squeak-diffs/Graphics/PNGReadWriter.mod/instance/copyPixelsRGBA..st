pixel copies
copyPixelsRGBA: y
	"Handle non-interlaced RGBA color modes (colorType = 6)"

	| i pixel tempForm tempBits ff |
	tempForm := Form extent: width@1 depth: 32.
	tempBits := tempForm bits.
	pixel := 0.
	i := -7.
	0 to: width-1 do: [ :x |
			i := i + 8.
			pixel := (thisScanline at: i+6) << 24.
			pixel := pixel bitOr: ((thisScanline at: i) << 16).
			pixel := pixel bitOr: ((thisScanline at: i+2) << 8).
			pixel := pixel bitOr: (thisScanline at: i+4).
			tempBits at: x+1 put: pixel.
	].
	tempForm displayOn: form at: 0@y rule: Form over.

