geometry
extent: aPoint 
	"change the receiver's extent"
	(bounds extent closeTo: aPoint) ifTrue: [^ self].
	super extent: aPoint.
	self updateColor