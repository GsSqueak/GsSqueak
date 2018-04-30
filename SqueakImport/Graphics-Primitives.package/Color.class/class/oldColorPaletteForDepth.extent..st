color from user
oldColorPaletteForDepth: depth extent: paletteExtent
	"Returns a form of the given size showing a color palette for the given depth."
	"(Color oldColorPaletteForDepth: Display depth extent: 720@100) display"

	| c p f nSteps rect w h q |
	f := Form extent: paletteExtent depth: depth.
	f fill: f boundingBox fillColor: Color white.
	nSteps := depth > 8 ifTrue: [12] ifFalse: [6].
	w := paletteExtent x // (nSteps * nSteps).
	h := paletteExtent y - 20 // nSteps.
	0 to: nSteps-1 do: [:r |
		0 to: nSteps-1 do: [:g |
			0 to: nSteps-1 do: [:b |
				c := Color r: r g: g b: b range: nSteps - 1.
				rect := ((r * nSteps * w) + (b * w)) @ (g * h) extent: w@(h + 1).
				f fill: rect fillColor: c]]].
	q := Quadrangle origin: paletteExtent - (50@19) corner: paletteExtent.
	q displayOn: f.
	'Trans.' displayOn: f at: q origin + (9@1).

	w := ((paletteExtent x - q width - 130) // 64) max: 1.
	p := paletteExtent x - q width - (64 * w) - 1 @ (paletteExtent y - 19).
	0 to: 63 do:
		[:v | c := Color r: v g: v b: v range: 63.
		f fill: ((v * w)@0 + p extent: (w + 1)@19) fillColor: c].
	^ f
