scrolling
vUnadjustedScrollRange
	| _gsSqueakTemp_range |
	_gsSqueakTemp_range := 0.
	scroller
		submorphsDo: [:m | m visible
				ifTrue: [_gsSqueakTemp_range := _gsSqueakTemp_range + m height]].
	^ _gsSqueakTemp_range