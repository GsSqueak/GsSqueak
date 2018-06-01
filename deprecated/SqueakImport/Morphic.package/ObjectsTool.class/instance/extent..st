layout
extent: anExtent
	"The user has dragged the grow box such that the receiver's extent would be anExtent.  Do what's needed"
	self extent = anExtent ifTrue: [ ^self ].
	super extent: anExtent.
	self fixLayoutFrames.