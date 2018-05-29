drawing
drawFrenchDoorOn: aCanvas
	"startForm and endFrom are both fixed, but a border expands out from a vertical (or H) slit, revealing endForm.
	It's like opening a pair of doors."
	| box innerForm outerForm boxExtent h w |
	h := self height. w := self width.
	direction = #in ifTrue: [innerForm := endForm.  outerForm := startForm.
							boxExtent := self stepFrom: 0@h to: self extent].
	direction = #out ifTrue: [innerForm := startForm.  outerForm := endForm.
							boxExtent := self stepFrom: self extent to: 0@h].
	direction = #inH ifTrue: [innerForm := endForm.  outerForm := startForm.
							boxExtent := self stepFrom: w@0 to: self extent].
	direction = #outH ifTrue: [innerForm := startForm.  outerForm := endForm.
							boxExtent := self stepFrom: self extent to: w@0].
		
	aCanvas drawImage: outerForm at: self position.

	box := Rectangle center: self center extent: boxExtent.
	aCanvas drawImage: innerForm at: box topLeft sourceRect: (box translateBy: self position negated).

	((box expandBy: 1) areasOutside: box) do:
		[:r | aCanvas fillRectangle: r color: Color black].
