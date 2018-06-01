event handling
mouseUp: evt
	"The mouse came back up, presumably after having dragged the tab.  Caution: if not operating full-screen, this notification can easily be *missed*, which is why the edge-fraction-computation is also being done on mouseMove."

	super mouseUp: evt.
	(self referentThickness <= 0 or:
		[(referent isInWorld and: [(referent boundsInWorld intersects: referent owner boundsInWorld) not])]) ifTrue:
			[self hideFlap.
			flapShowing := false].
	self fitOnScreen.
	dragged ifTrue:
		[self computeEdgeFraction.
		dragged := false].
	Flaps doAutomaticLayoutOfFlapsIfAppropriate