drawing
drawZoomOn: aCanvas 
	"Zoom in: endForm expands overlaying startForm.
	Zoom out: startForm contracts revealing endForm."
	| _gsSqueakTemp_box _gsSqueakTemp_innerForm _gsSqueakTemp_outerForm _gsSqueakTemp_boxExtent _gsSqueakTemp_scale |
	direction = #in
		ifTrue: [_gsSqueakTemp_innerForm := endForm.
			_gsSqueakTemp_outerForm := startForm.
			_gsSqueakTemp_boxExtent := self stepFrom: 0 @ 0 to: self extent]
		ifFalse: [_gsSqueakTemp_innerForm := startForm.
			_gsSqueakTemp_outerForm := endForm.
			_gsSqueakTemp_boxExtent := self stepFrom: self extent to: 0 @ 0].
	aCanvas drawImage: _gsSqueakTemp_outerForm at: self position.
	_gsSqueakTemp_box := Rectangle center: self center extent: _gsSqueakTemp_boxExtent.
	_gsSqueakTemp_scale := _gsSqueakTemp_box extent asFloatPoint / bounds extent.
	aCanvas
		drawImage: (_gsSqueakTemp_innerForm
				magnify: _gsSqueakTemp_innerForm boundingBox
				by: _gsSqueakTemp_scale
				smoothing: 1)
		at: _gsSqueakTemp_box topLeft.
	((_gsSqueakTemp_box expandBy: 1)
		areasOutside: _gsSqueakTemp_box)
		do: [:r | aCanvas fillRectangle: r color: Color black]