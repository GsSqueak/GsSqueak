mouseover & dragover
startOrFinishDrawing: evt 
	| _gsSqueakTemp_w |
	self flapShowing
		ifTrue: [(_gsSqueakTemp_w := self world) makeNewDrawing: evt at: _gsSqueakTemp_w center]
		ifFalse: [self world endDrawing: evt]