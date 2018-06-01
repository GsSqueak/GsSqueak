e-toy support
embeddedInMorphicWindowLabeled: labelString
	| window |
	window := (SystemWindow labelled: labelString) model: nil.
	window setStripeColorsFrom: Color white.
	window addMorph: self frame: (0@0 extent: 1@1).
	^ window