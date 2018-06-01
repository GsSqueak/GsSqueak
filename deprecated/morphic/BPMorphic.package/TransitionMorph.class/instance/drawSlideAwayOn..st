drawing
drawSlideAwayOn: aCanvas 
	"startMorph slides away in the given direction, revealing up the
	endMorph. "
	| _gsSqueakTemp_startLoc _gsSqueakTemp_moveRect |
	_gsSqueakTemp_startLoc := self stepFrom: self position to: self position + (self extent * direction).
	_gsSqueakTemp_moveRect := startForm boundingBox translateBy: _gsSqueakTemp_startLoc.
	aCanvas drawImage: endForm at: self position.
	aCanvas drawImage: startForm at: _gsSqueakTemp_startLoc.
	((_gsSqueakTemp_moveRect translateBy: direction negated)
		areasOutside: _gsSqueakTemp_moveRect)
		do: [:r | aCanvas fillRectangle: r color: Color black]