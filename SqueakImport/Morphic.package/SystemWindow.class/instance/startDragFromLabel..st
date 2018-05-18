events
startDragFromLabel: evt
	"When label events are active, we need to pass dragging to the window explicitely
	 The window only recognizes a drag with an offset of more than 3 pixels"
	
	self isSticky ifTrue: [^ self].
	self fastFramingOn 
		ifTrue: [self doFastFrameDrag: evt cursorPoint]
		ifFalse: [
			self hasDropShadow: false.
			evt hand grabMorph: self topRendererOrSelf]
