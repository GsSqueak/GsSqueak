drawing
drawSlideOverOn: aCanvas 
	"endMorph slides in the given direction, covering up the startMorph."
	| _gsSqueakTemp_endLoc _gsSqueakTemp_endRect |
	_gsSqueakTemp_endLoc := self stepFrom: self position - (self extent * direction) to: self position.
	_gsSqueakTemp_endRect := endForm boundingBox translateBy: _gsSqueakTemp_endLoc.
	((_gsSqueakTemp_endRect expandBy: 1)
			containsRect: aCanvas clipRect)
		ifFalse: [aCanvas drawImage: startForm at: self position].
	aCanvas drawImage: endForm at: _gsSqueakTemp_endLoc.
	((_gsSqueakTemp_endRect translateBy: direction)
		areasOutside: _gsSqueakTemp_endRect)
		do: [:r | aCanvas fillRectangle: r color: Color black]