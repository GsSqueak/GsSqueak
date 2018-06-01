dropping/grabbing
justDroppedInto: aPasteUpMorph event: anEvent
	"This message is sent to a dropped morph after it has been dropped on--and been accepted by--a drop-sensitive morph"
	aPasteUpMorph isPartsBin ifFalse:[
		self removeHalo.
		self delete.
		^aPasteUpMorph makeNewDrawing: anEvent].
	^super justDroppedInto: aPasteUpMorph event: anEvent