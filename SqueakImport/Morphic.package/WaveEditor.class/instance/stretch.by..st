other
stretch: sampleArray by: stretchFactor
	"Return an array consisting of the given samples \stretched in time by the given factor."

	| out end incr i frac index |
	out := OrderedCollection new: (stretchFactor * sampleArray size) asInteger + 1.
	end := (sampleArray size - 1) asFloat.
	incr := 1.0 / stretchFactor.
	i := 1.0.
	[i < end] whileTrue: [
		frac := i fractionPart.
		index := i truncated.
		i := i + incr.
		out addLast:
			(((1.0 - frac) * (sampleArray at: index)) + (frac * (sampleArray at: index + 1))) rounded].
	^ out asArray
