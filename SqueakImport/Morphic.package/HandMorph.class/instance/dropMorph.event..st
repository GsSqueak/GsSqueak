grabbing/dropping
dropMorph: aMorph event: anEvent
	"Drop the given morph which was carried by the hand"
	| event dropped |
	(anEvent isMouseUp and:[aMorph shouldDropOnMouseUp not]) ifTrue:[^self].

	"Note: For robustness in drag and drop handling we remove the morph BEFORE we drop him, but we keep his owner set to the hand. This prevents system lockups when there is a problem in drop handling (for example if there's an error in #wantsToBeDroppedInto:). THIS TECHNIQUE IS NOT RECOMMENDED FOR CASUAL USE."
	self privateRemove: aMorph.
	aMorph privateOwner: self.

	dropped := aMorph.
	(dropped hasProperty: #addedFlexAtGrab) 
		ifTrue:[dropped := aMorph removeFlexShell].
	event := DropEvent new setPosition: self position contents: dropped hand: self.
	
	[ "In case of an error, ensure that the morph-to-be-dropped will be disposed. Otherwise it may confuse garbage handler. See the sends of #privateRemove: and #privateOwner: above."
		event := self sendEvent: event focus: nil. "event filters can apply and filtered events will be returned"
		event wasHandled ifFalse: [aMorph rejectDropMorphEvent: event] ]
			ensure: [ aMorph owner == self ifTrue: [aMorph delete] ].
	
	self mouseOverHandler processMouseOver: anEvent.