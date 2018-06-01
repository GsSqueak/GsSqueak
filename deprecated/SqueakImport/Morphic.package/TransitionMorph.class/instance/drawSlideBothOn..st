drawing
drawSlideBothOn: aCanvas
	"endMorph slides in the given direction, as startMorph slides out of its way."
	| endLoc endRect startLoc |
	startLoc := self stepFrom: self position to: self position + (self extent * direction).
	aCanvas drawImage: startForm at: startLoc.

	endLoc := self stepFrom: self position - (self extent * direction) to: self position.
	aCanvas drawImage: endForm at: endLoc.

	endRect := endForm boundingBox translateBy: endLoc.
	((endRect translateBy: direction) areasOutside: endRect) do:
		[:r | aCanvas fillRectangle: r color: Color black].
