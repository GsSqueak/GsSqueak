other
convertVelocity: valueByte
	"Map a value in the range 0..127 to a volume in the range 0.0..1.0."
	"Details: A quadratic function seems to give a good keyboard feel."

	| r |
	r := (valueByte * valueByte) / 12000.0.
	r > 1.0 ifTrue: [^ 1.0].
	r < 0.08 ifTrue: [^ 0.08].
	^ r
