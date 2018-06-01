mouseover & dragover
makeNewDrawing: evt
	self flapShowing ifTrue:[
		self world makeNewDrawing: evt.
	] ifFalse:[
		self world assureNotPaintingEvent: evt.
	].