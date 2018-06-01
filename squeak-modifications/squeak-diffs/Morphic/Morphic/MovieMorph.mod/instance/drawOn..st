drawing
drawOn: aCanvas 
	| frame |
	frame := self currentFrame.
	frame notNil 
		ifTrue: [^frame drawOn: aCanvas]
		ifFalse: [^super drawOn: aCanvas]