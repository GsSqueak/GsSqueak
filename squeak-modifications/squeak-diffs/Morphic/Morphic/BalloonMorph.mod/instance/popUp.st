initialization
popUp
	| w worldBounds |
	target ifNil: [^ self].
	target isInWorld ifFalse: [^ self].
	w := target world.
	self prepareToOpen.
	"So that if the translation below makes it overlap the receiver, it won't interfere with the rootMorphsAt: logic and hence cause flashing.  Without this, flashing happens, believe me!"
	((worldBounds := w bounds) containsRect: self bounds) ifFalse:
		[self bounds: (self bounds translatedToBeWithin: worldBounds)].
	self openInWorld.
	w activeHand addBalloonHelp: self.
	