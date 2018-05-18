geometry
extent: aPoint 
	"Set the receiver's extent to value provided. Respect my minimumExtent."

	| newExtent |
	newExtent := self isCollapsed
		ifTrue: [aPoint]
		ifFalse: [aPoint max: self minimumExtent].
	newExtent = self extent ifTrue: [^ self].

	isCollapsed
		ifTrue: [super extent: newExtent x @ (self labelHeight + (self layoutInset * 2))]
		ifFalse: [super extent: newExtent].
	isCollapsed
		ifTrue: [collapsedFrame := self bounds]
		ifFalse: [fullFrame := self bounds]