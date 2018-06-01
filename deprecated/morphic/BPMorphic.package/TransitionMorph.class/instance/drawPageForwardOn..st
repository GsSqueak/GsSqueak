drawing
drawPageForwardOn: aCanvas 
	"startForm shrinks in the given direction, revealing endForm."
	| _gsSqueakTemp_offset _gsSqueakTemp_shrinkRect _gsSqueakTemp_scale |
	aCanvas drawImage: endForm at: self position.
	_gsSqueakTemp_offset := self stepFrom: 0 @ 0 to: self extent * direction.
	_gsSqueakTemp_shrinkRect := (bounds translateBy: _gsSqueakTemp_offset)
				intersect: bounds.
	_gsSqueakTemp_scale := _gsSqueakTemp_shrinkRect extent asFloatPoint / bounds extent.
	aCanvas
		drawImage: (startForm
				magnify: startForm boundingBox
				by: _gsSqueakTemp_scale
				smoothing: 1)
		at: _gsSqueakTemp_shrinkRect topLeft.
	((_gsSqueakTemp_shrinkRect translateBy: direction negated)
		areasOutside: _gsSqueakTemp_shrinkRect)
		do: [:r | aCanvas fillRectangle: r color: Color black]