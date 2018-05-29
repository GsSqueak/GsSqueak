drawing
drawPageForwardOn: aCanvas
	"startForm shrinks in the given direction, revealing endForm."
	| offset shrinkRect scale |
	aCanvas drawImage: endForm at: self position.

	offset := self stepFrom: 0@0 to: self extent * direction.
	shrinkRect := (bounds translateBy: offset) intersect: bounds.
	scale := shrinkRect extent asFloatPoint / bounds extent.
	aCanvas drawImage: (startForm magnify: startForm boundingBox by: scale smoothing: 1)
		at: shrinkRect topLeft.

	((shrinkRect translateBy: direction negated) areasOutside: shrinkRect) do:
		[:r | aCanvas fillRectangle: r color: Color black].
