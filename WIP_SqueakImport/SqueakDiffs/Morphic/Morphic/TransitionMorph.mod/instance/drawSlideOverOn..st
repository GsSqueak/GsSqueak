drawing
drawSlideOverOn: aCanvas
	"endMorph slides in the given direction, covering up the startMorph."
	| endLoc endRect |
	endLoc := self stepFrom: self position - (self extent * direction) to: self position.
	endRect := endForm boundingBox translateBy: endLoc.

	((endRect expandBy: 1) containsRect: aCanvas clipRect) ifFalse:
		[aCanvas drawImage: startForm at: self position].
	aCanvas drawImage: endForm at: endLoc.

	((endRect translateBy: direction) areasOutside: endRect) do:
		[:r | aCanvas fillRectangle: r color: Color black].
