drawing
drawOn: aCanvas
	| f |
	f := self rotatedForm.
	backgroundColor ifNotNil: [aCanvas fillRectangle: bounds fillStyle: backgroundColor].
	aCanvas translucentImage: f at: bounds origin.