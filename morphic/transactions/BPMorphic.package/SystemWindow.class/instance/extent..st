geometry
extent: aPoint 
	"Set the receiver's extent to value provided. Respect my
	minimumExtent. "
	| _gsSqueakTemp_newExtent |
	_gsSqueakTemp_newExtent := self isCollapsed
				ifTrue: [aPoint]
				ifFalse: [aPoint max: self minimumExtent].
	_gsSqueakTemp_newExtent = self extent
		ifTrue: [^ self].
	isCollapsed
		ifTrue: [super extent: _gsSqueakTemp_newExtent x @ (self labelHeight + (self layoutInset * 2))]
		ifFalse: [super extent: _gsSqueakTemp_newExtent].
	isCollapsed
		ifTrue: [collapsedFrame := self bounds]
		ifFalse: [fullFrame := self bounds]