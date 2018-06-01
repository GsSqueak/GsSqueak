drawing
drawZoomFrameOn: aCanvas 
	"startForm and endFrom are both fixed, but a square border expands
	out from the center (or back), revealing endForm.
	It's like passing through a portal."
	| _gsSqueakTemp_box _gsSqueakTemp_innerForm _gsSqueakTemp_outerForm _gsSqueakTemp_boxExtent |
	direction = #in
		ifTrue: [_gsSqueakTemp_innerForm := endForm.
			_gsSqueakTemp_outerForm := startForm.
			_gsSqueakTemp_boxExtent := self stepFrom: 0 @ 0 to: self extent]
		ifFalse: [_gsSqueakTemp_innerForm := startForm.
			_gsSqueakTemp_outerForm := endForm.
			_gsSqueakTemp_boxExtent := self stepFrom: self extent to: 0 @ 0].
	aCanvas drawImage: _gsSqueakTemp_outerForm at: self position.
	_gsSqueakTemp_box := Rectangle center: self center extent: _gsSqueakTemp_boxExtent.
	aCanvas
		drawImage: _gsSqueakTemp_innerForm
		at: _gsSqueakTemp_box topLeft
		sourceRect: (_gsSqueakTemp_box translateBy: self position negated).
	((_gsSqueakTemp_box expandBy: 1)
		areasOutside: _gsSqueakTemp_box)
		do: [:r | aCanvas fillRectangle: r color: Color black]