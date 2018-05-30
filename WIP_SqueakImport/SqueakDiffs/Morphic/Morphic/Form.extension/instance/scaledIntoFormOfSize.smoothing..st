*Morphic
scaledIntoFormOfSize: aNumberOrPoint smoothing: factor
	"Scale and center the receiver into a form of a given size"

	| extent scaledForm result |

	extent := aNumberOrPoint asPoint.
	extent = self extent ifTrue: [^ self copy].

	scaledForm := self scaledToSize: extent smoothing: factor.

	result := self species extent: extent depth: self depth.
	result getCanvas
		translucentImage: scaledForm
		at: extent - scaledForm extent // 2.

	^ result
