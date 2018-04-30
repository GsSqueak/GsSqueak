drawing
drawSlideBorderOn: aCanvas 
	"startForm and endFrom are both fixed, but a border slides in the
	given direction, revealing endForm. (It's like opening a can of sardines
	;-). "
	| _gsSqueakTemp_endRect _gsSqueakTemp_box _gsSqueakTemp_sourceRect _gsSqueakTemp_boxLoc |
	_gsSqueakTemp_box := endForm boundingBox.
	_gsSqueakTemp_boxLoc := self stepFrom: _gsSqueakTemp_box topLeft - (_gsSqueakTemp_box extent * direction) to: _gsSqueakTemp_box topLeft.
	_gsSqueakTemp_sourceRect := _gsSqueakTemp_box translateBy: _gsSqueakTemp_boxLoc.
	_gsSqueakTemp_endRect := _gsSqueakTemp_sourceRect translateBy: self position.
	((_gsSqueakTemp_endRect expandBy: 1)
			containsRect: aCanvas clipRect)
		ifFalse: [aCanvas drawImage: startForm at: self position].
	aCanvas
		drawImage: endForm
		at: self position + _gsSqueakTemp_boxLoc
		sourceRect: _gsSqueakTemp_sourceRect.
	((_gsSqueakTemp_endRect translateBy: direction)
		areasOutside: _gsSqueakTemp_endRect)
		do: [:r | aCanvas fillRectangle: r color: Color black]