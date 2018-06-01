initialization
updateFillStyle
	"Update the fill style directions."

	|b fs|
	fs := self fillStyle.
	fs isOrientedFill ifTrue: [
		b := self innerBounds.
		fs origin: b topLeft.
		fs direction: (self orientation == #horizontal
			ifTrue: [b width@0]
			ifFalse: [0@b height])]