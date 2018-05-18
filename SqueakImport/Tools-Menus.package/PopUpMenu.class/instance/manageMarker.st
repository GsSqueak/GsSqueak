marker adjustment
manageMarker
	"If the cursor is inside the receiver's frame, then highlight the marked 
	item. Otherwise no item is to be marked."
	| pt |
	"Don't let pt get far from display box, so scrolling will go all the way"
	pt := Sensor cursorPoint adhereTo: (Display boundingBox expandBy: 1).
	(frame inside containsPoint: pt)
		ifTrue: ["Need to cache the form for reasonable scrolling performance"
				((Display boundingBox insetBy: 0@3) containsPoint: pt)
					ifFalse: [pt := pt - (self scrollIntoView: pt)].
				self markerOn: pt]
		ifFalse: [self markerOff]