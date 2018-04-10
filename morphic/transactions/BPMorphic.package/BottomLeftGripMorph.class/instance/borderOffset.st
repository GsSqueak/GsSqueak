private
borderOffset
	| _gsSqueakTemp_width |
	_gsSqueakTemp_width := SystemWindow borderWidth + 1.
	^ self handleOrigin + (_gsSqueakTemp_width @ _gsSqueakTemp_width negated)