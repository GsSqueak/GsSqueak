drawing
drawZoomFrameOn: aCanvas
	"startForm and endFrom are both fixed, but a square border expands out from the center (or back), revealing endForm.
	It's like passing through a portal."
	| box innerForm outerForm boxExtent |
	direction = #in
		ifTrue: [innerForm := endForm.  outerForm := startForm.
				boxExtent := self stepFrom: 0@0 to: self extent]
		ifFalse: [innerForm := startForm.  outerForm := endForm.
				boxExtent := self stepFrom: self extent to: 0@0].
		
	aCanvas drawImage: outerForm at: self position.

	box := Rectangle center: self center extent: boxExtent.
	aCanvas drawImage: innerForm at: box topLeft sourceRect: (box translateBy: self position negated).

	((box expandBy: 1) areasOutside: box) do:
		[:r | aCanvas fillRectangle: r color: Color black].
