geometry
computeSlider
	| _gsSqueakTemp_r _gsSqueakTemp_v |
	_gsSqueakTemp_r := self roomToMove.
	_gsSqueakTemp_v := self maximumValue = self minimumValue
				ifTrue: [0]
				ifFalse: [value - self minimumValue / (self maximumValue - self minimumValue)].
	self descending
		ifTrue: [slider
				position: (self orientation == #horizontal
						ifTrue: [_gsSqueakTemp_r bottomRight - ((_gsSqueakTemp_r width * _gsSqueakTemp_v) asInteger @ 0)]
						ifFalse: [_gsSqueakTemp_r bottomRight - (0 @ (_gsSqueakTemp_r height * _gsSqueakTemp_v) asInteger)])]
		ifFalse: [slider
				position: (self orientation == #horizontal
						ifTrue: [_gsSqueakTemp_r topLeft + ((_gsSqueakTemp_r width * _gsSqueakTemp_v) asInteger @ 0)]
						ifFalse: [_gsSqueakTemp_r topLeft + (0 @ (_gsSqueakTemp_r height * _gsSqueakTemp_v) asInteger)])].
	slider extent: self sliderExtent