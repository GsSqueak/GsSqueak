drawing
drawOn: aCanvas
	"Image plus circles for currently selected color."

	| c |
	super drawOn: aCanvas.
	locOfCurrent ifNotNil: [
		c := self ringColor.
		aCanvas
			fillOval: (Rectangle center: locOfCurrent + self topLeft extent: 9@9)
			color: Color transparent
			borderWidth: 1
			borderColor: c].
