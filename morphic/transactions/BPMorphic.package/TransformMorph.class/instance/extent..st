geometry
extent: aPoint 
	"Change my layout only if I change my extent. See my implementation
	of #layoutChanged."
	(bounds extent closeTo: aPoint)
		ifTrue: [^ self].
	super extent: aPoint.
	super layoutChanged