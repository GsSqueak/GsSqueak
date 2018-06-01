mouseover & dragover
startOrFinishDrawing: evt
	| w |
	self flapShowing ifTrue:[
		(w := self world) makeNewDrawing: evt at:  w center.
	] ifFalse:[
		self world endDrawing: evt.
	].