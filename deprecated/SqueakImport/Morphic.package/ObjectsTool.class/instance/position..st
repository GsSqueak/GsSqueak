layout
position: aPoint
	"The user has dragged the grow box such that the receiver's extent would be anExtent.  Do what's needed"
	self position = aPoint ifTrue: [ ^self ].
	super position: aPoint.
	self fixLayoutFrames.