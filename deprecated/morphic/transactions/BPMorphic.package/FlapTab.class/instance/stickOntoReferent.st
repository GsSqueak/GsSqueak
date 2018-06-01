positioning
stickOntoReferent
	"Place the receiver directly onto the referent -- for use when the
	referent is being shown as a flap"
	| _gsSqueakTemp_newPosition |
	referent addMorph: self.
	edgeToAdhereTo == #left
		ifTrue: [_gsSqueakTemp_newPosition := referent width - self width @ self top].
	edgeToAdhereTo == #right
		ifTrue: [_gsSqueakTemp_newPosition := referent left @ self top].
	edgeToAdhereTo == #top
		ifTrue: [_gsSqueakTemp_newPosition := self left @ (referent height - self height)].
	edgeToAdhereTo == #bottom
		ifTrue: [_gsSqueakTemp_newPosition := self left @ referent top].
	self position: _gsSqueakTemp_newPosition