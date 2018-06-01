layout
minHeightFrom: minHeight 
	"Return the minimal extent the given bounds can be represented in"
	| _gsSqueakTemp_height _gsSqueakTemp_top _gsSqueakTemp_bottom |
	_gsSqueakTemp_top := topFraction
				ifNil: [0.0].
	_gsSqueakTemp_bottom := bottomFraction
				ifNil: [1.0].
	_gsSqueakTemp_height := _gsSqueakTemp_bottom = _gsSqueakTemp_top
				ifTrue: [0]
				ifFalse: [minHeight / (_gsSqueakTemp_bottom - _gsSqueakTemp_top)].
	topOffset
		ifNotNil: [_gsSqueakTemp_height := _gsSqueakTemp_height + topOffset].
	bottomOffset
		ifNotNil: [_gsSqueakTemp_height := _gsSqueakTemp_height + bottomOffset].
	^ _gsSqueakTemp_height truncated