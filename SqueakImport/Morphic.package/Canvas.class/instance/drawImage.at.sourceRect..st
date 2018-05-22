drawing-images
drawImage: aForm at: aPoint sourceRect: sourceRect
	"Draw the given form."
	self shadowColor ifNotNil:[
		^self fillRectangle: ((aForm boundingBox intersect: sourceRect) translateBy: aPoint)
				color: self shadowColor].
	^self image: aForm
		at: aPoint
		sourceRect: sourceRect
		rule: Form over