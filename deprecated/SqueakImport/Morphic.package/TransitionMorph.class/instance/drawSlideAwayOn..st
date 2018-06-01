drawing
drawSlideAwayOn: aCanvas
	"startMorph slides away in the given direction, revealing up the endMorph."
	| startLoc moveRect |
	startLoc := self stepFrom: self position to: self position + (self extent * direction).
	moveRect := startForm boundingBox translateBy: startLoc.

	aCanvas drawImage: endForm at: self position.
	aCanvas drawImage: startForm at: startLoc.

	((moveRect translateBy: direction negated) areasOutside: moveRect) do:
		[:r | aCanvas fillRectangle: r color: Color black].
