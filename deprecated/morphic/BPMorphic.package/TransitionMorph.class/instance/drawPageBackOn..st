drawing
drawPageBackOn: aCanvas 
	"endForm grows in the given direction, overlaying endForm."
	| _gsSqueakTemp_offset _gsSqueakTemp_growRect _gsSqueakTemp_scale |
	aCanvas drawImage: startForm at: self position.
	_gsSqueakTemp_offset := self stepFrom: self extent * direction negated to: 0 @ 0.
	_gsSqueakTemp_growRect := (bounds translateBy: _gsSqueakTemp_offset)
				intersect: bounds.
	_gsSqueakTemp_scale := _gsSqueakTemp_growRect extent asFloatPoint / bounds extent.
	aCanvas
		drawImage: (endForm
				magnify: endForm boundingBox
				by: _gsSqueakTemp_scale
				smoothing: 1)
		at: _gsSqueakTemp_growRect topLeft.
	((_gsSqueakTemp_growRect translateBy: direction)
		areasOutside: _gsSqueakTemp_growRect)
		do: [:r | aCanvas fillRectangle: r color: Color black]