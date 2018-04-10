-animations-core
fullDrawAnimatedOn: aCanvas 
	| _gsSqueakTemp_transformedCanvas |
	self visible
		ifFalse: [^ self].
	(aCanvas isVisible: self fullBounds)
		ifFalse: [^ self].
	Project current isAnimatedMorphic
		ifFalse: [^ self fullDrawOn: aCanvas].
	(self hasProperty: #errorOnDraw)
		ifTrue: [^ self drawErrorOn: aCanvas].
	"Get the correct canvas for graphics animations."
	_gsSqueakTemp_transformedCanvas := self ignoresColorMappings
				ifTrue: [aCanvas originalCanvas]
				ifFalse: [Project current animations transformedCanvasFor: self from: aCanvas].
	(Project current animations isAtLeastOneGraphicsAnimationRunningFor: self)
		ifTrue: [self
				invalidRect: (_gsSqueakTemp_transformedCanvas clipRect intersect: self fullBounds)].
	self fullDrawOn: _gsSqueakTemp_transformedCanvas