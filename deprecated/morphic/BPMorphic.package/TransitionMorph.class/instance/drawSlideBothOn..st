drawing
drawSlideBothOn: aCanvas 
	"endMorph slides in the given direction, as startMorph slides out of its
	way. "
	| _gsSqueakTemp_endLoc _gsSqueakTemp_endRect _gsSqueakTemp_startLoc |
	_gsSqueakTemp_startLoc := self stepFrom: self position to: self position + (self extent * direction).
	aCanvas drawImage: startForm at: _gsSqueakTemp_startLoc.
	_gsSqueakTemp_endLoc := self stepFrom: self position - (self extent * direction) to: self position.
	aCanvas drawImage: endForm at: _gsSqueakTemp_endLoc.
	_gsSqueakTemp_endRect := endForm boundingBox translateBy: _gsSqueakTemp_endLoc.
	((_gsSqueakTemp_endRect translateBy: direction)
		areasOutside: _gsSqueakTemp_endRect)
		do: [:r | aCanvas fillRectangle: r color: Color black]