positioning
stickOntoReferent
	"Place the receiver directly onto the referent -- for use when the referent is being shown as a flap"
	| newPosition |
	referent addMorph: self.
	edgeToAdhereTo == #left
		ifTrue:
			[newPosition := (referent width - self width) @ self top].
	edgeToAdhereTo == #right
		ifTrue:
			[newPosition := (referent left @ self top)].
	edgeToAdhereTo == #top
		ifTrue:
			[newPosition := self left @ (referent height - self height)].
	edgeToAdhereTo == #bottom
		ifTrue:
			[newPosition := self left @ referent top].
	self position: newPosition