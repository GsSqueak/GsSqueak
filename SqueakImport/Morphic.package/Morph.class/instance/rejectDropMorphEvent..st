dropping/grabbing
rejectDropMorphEvent: evt
	"The receiver has been rejected, and must be put back somewhere.  There are three cases:
	(1)  It remembers its former owner and position, and goes right back there
	(2)  It remembers its former position only, in which case it was torn off from a parts bin, and the UI is that it floats back to its donor position and then vanishes.
	(3)  Neither former owner nor position is remembered, in which case it is whisked to the Trash"

	self removeProperty: #undoGrabCommand.
	(self formerOwner notNil and: [self formerOwner isPartsBin not]) ifTrue:
		[^ self slideBackToFormerSituation: evt].

	self formerPosition ifNotNil:  "Position but no owner -- can just make it vanish"
		[^ self vanishAfterSlidingTo: self formerPosition event: evt].
		
	self slideToTrash: evt