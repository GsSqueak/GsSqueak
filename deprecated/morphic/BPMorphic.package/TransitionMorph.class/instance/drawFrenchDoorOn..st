drawing
drawFrenchDoorOn: aCanvas 
	"startForm and endFrom are both fixed, but a border expands out
	from a vertical (or H) slit, revealing endForm.
	It's like opening a pair of doors."
	| _gsSqueakTemp_box _gsSqueakTemp_innerForm _gsSqueakTemp_outerForm _gsSqueakTemp_boxExtent _gsSqueakTemp_h _gsSqueakTemp_w |
	_gsSqueakTemp_h := self height.
	_gsSqueakTemp_w := self width.
	direction = #in
		ifTrue: [_gsSqueakTemp_innerForm := endForm.
			_gsSqueakTemp_outerForm := startForm.
			_gsSqueakTemp_boxExtent := self stepFrom: 0 @ _gsSqueakTemp_h to: self extent].
	direction = #out
		ifTrue: [_gsSqueakTemp_innerForm := startForm.
			_gsSqueakTemp_outerForm := endForm.
			_gsSqueakTemp_boxExtent := self stepFrom: self extent to: 0 @ _gsSqueakTemp_h].
	direction = #inH
		ifTrue: [_gsSqueakTemp_innerForm := endForm.
			_gsSqueakTemp_outerForm := startForm.
			_gsSqueakTemp_boxExtent := self stepFrom: _gsSqueakTemp_w @ 0 to: self extent].
	direction = #outH
		ifTrue: [_gsSqueakTemp_innerForm := startForm.
			_gsSqueakTemp_outerForm := endForm.
			_gsSqueakTemp_boxExtent := self stepFrom: self extent to: _gsSqueakTemp_w @ 0].
	aCanvas drawImage: _gsSqueakTemp_outerForm at: self position.
	_gsSqueakTemp_box := Rectangle center: self center extent: _gsSqueakTemp_boxExtent.
	aCanvas
		drawImage: _gsSqueakTemp_innerForm
		at: _gsSqueakTemp_box topLeft
		sourceRect: (_gsSqueakTemp_box translateBy: self position negated).
	((_gsSqueakTemp_box expandBy: 1)
		areasOutside: _gsSqueakTemp_box)
		do: [:r | aCanvas fillRectangle: r color: Color black]