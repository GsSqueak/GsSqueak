accessing
interpolatedValueAtCursor
	| sz prev frac next |
	data isEmpty ifTrue: [^0].
	sz := data size.
	cursor < 0 ifTrue: [^data first].	"just to be safe, though cursor shouldn't be negative"
	prev := cursor truncated.
	frac := cursor - prev.
	prev < 1 ifTrue: [prev := sz].
	prev > sz ifTrue: [prev := 1].
	"assert: 1 <= prev <= sz"
	frac = 0 ifTrue: [^data at: prev].	"no interpolation needed"

	"interpolate"
	next := prev = sz ifTrue: [1] ifFalse: [prev + 1].
	^(1.0 - frac) * (data at: prev) + (frac * (data at: next))