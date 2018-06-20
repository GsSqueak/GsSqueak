pixel copies
copyPixelsRGB: y
	"Handle non-interlaced RGB color mode (colorType = 2)"

	| i pixel tempForm tempBits |
	tempForm := Form extent: width@1 depth: 32.
	tempBits := tempForm bits.
	pixel := 16rff000000. "set alpha to 16rff"
	bitsPerChannel = 8
		ifTrue:
			[i := 1.
			1 to: width do:
				[ :x |
				pixel := pixel bitAnd: 16rff000000.
				pixel := pixel bitOr: ((thisScanline at: i) << 16).
				pixel := pixel bitOr: ((thisScanline at: i+1) << 8).
				pixel := pixel bitOr: (thisScanline at: i+2).
				tempBits at: x put: pixel.
				i := i + 3].
			transparentPixelValue
				ifNotNil:
					[1 to: width do: [ :x |
						(tempBits at: x) = transparentPixelValue
							ifTrue: [tempBits at: x put: 0]]]]
		ifFalse:
			[i := 1.
			1 to: width do:
				[ :x |
				(transparentPixelValue == nil or: [(1 to: 6) anySatisfy: [:k | (transparentPixelValue digitAt: k) ~= (thisScanline at: i + 6 - k)]])
					ifTrue: [
						self halt.
						pixel := pixel bitAnd: 16rff000000.
						pixel := pixel bitOr: ((thisScanline at: i) << 16).
						pixel := pixel bitOr: ((thisScanline at: i+2) << 8).
						pixel := pixel bitOr: (thisScanline at: i+4).
						tempBits at: x put: pixel]
					ifFalse:
						[tempBits at: x put: 0].
				i := i + 6]].
	
	tempForm displayOn: form at: 0@y rule: Form over.

