events-processing
handleMouseEnter: anEvent
	"System level event handling."
	(anEvent isDraggingEvent) ifTrue:[
		(self handlesMouseOverDragging: anEvent) ifTrue:[
			anEvent wasHandled: true.
			self mouseEnterDragging: anEvent].
		^self].
	self wantsHalo "If receiver wants halo and balloon, trigger balloon after halo"
		ifTrue:[anEvent hand triggerHaloFor: self after: self haloDelayTime]
		ifFalse:[self wantsBalloon
			ifTrue:[anEvent hand triggerBalloonFor: self after: self balloonHelpDelayTime]].
	(self handlesMouseOver: anEvent) ifTrue:[
		anEvent wasHandled: true.
		self mouseEnter: anEvent.
	].