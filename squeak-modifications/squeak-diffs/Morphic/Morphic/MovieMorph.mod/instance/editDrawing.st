menu
editDrawing
	| frame |
	frame := self currentFrame.
	frame notNil 
		ifTrue: [frame editDrawingIn: self pasteUpMorph forBackground: false]