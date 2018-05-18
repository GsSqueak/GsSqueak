layout
acceptDroppingMorph: morphToDrop event: evt
	"Accept -- in a custom sense here -- a morph dropped on the receiver."

	| myCopy smallR |

	(self isTheRealProjectPresent) ifFalse: [
		^morphToDrop rejectDropMorphEvent: evt.		"can't handle it right now"
	].
	(morphToDrop isKindOf: NewHandleMorph) ifTrue: [	"don't send these"
		^morphToDrop rejectDropMorphEvent: evt.
	].
	self dropEnabled ifFalse:
		[^ morphToDrop rejectDropMorphEvent: evt].

	self eToyRejectDropMorph: morphToDrop event: evt.		"we will send a copy"
	myCopy := morphToDrop veryDeepCopy.	"gradient fills require doing this second"
	smallR := (morphToDrop bounds scaleBy: image height / Display height) rounded.
	smallR := smallR squishedWithin: image boundingBox.
	image getCanvas
		paintImage: (morphToDrop imageForm scaledToSize: smallR extent)
		at: smallR topLeft.
	myCopy openInWorld: project world

