dropping
justDroppedInto: aPasteUpMorph event: anEvent
	"This message is sent to a dropped morph after it has been dropped on--and been accepted by--a drop-sensitive morph"

	super justDroppedInto: aPasteUpMorph event: anEvent.
	
	aPasteUpMorph isPartsBin ifFalse: [
		"Do not show this morph in the screenshot."
		self hide.
		anEvent hand hide.
		self refreshWorld.

		[aPasteUpMorph grabLassoFromScreen: anEvent]
			ensure: [anEvent hand show]].

	"Just needed for this operation. Remove."	
	self delete.