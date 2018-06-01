-animations-core
transformedCanvasOn: aCanvas 
	| _gsSqueakTemp_transformedCanvas |
	_gsSqueakTemp_transformedCanvas := self ignoresColorMappings
				ifTrue: [aCanvas originalCanvas]
				ifFalse: [Project current animations transformedCanvasFor: self from: aCanvas].
	(Project current animations isAtLeastOneGraphicsAnimationRunningFor: self)
		ifTrue: [self
				invalidRect: (_gsSqueakTemp_transformedCanvas clipRect intersect: self fullBounds)].
	^ _gsSqueakTemp_transformedCanvas