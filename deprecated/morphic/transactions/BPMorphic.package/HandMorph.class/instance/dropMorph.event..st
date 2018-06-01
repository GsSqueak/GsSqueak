grabbing/dropping
dropMorph: aMorph event: anEvent 
	"Drop the given morph which was carried by the hand"
	| _gsSqueakTemp_event _gsSqueakTemp_dropped |
	(anEvent isMouseUp
			and: [aMorph shouldDropOnMouseUp not])
		ifTrue: [^ self].
	"Note: For robustness in drag and drop handling we remove the morph
	BEFORE we drop him, but we keep his owner set to the hand. This
	prevents system lockups when there is a problem in drop handling
	(for example if there's an error in #wantsToBeDroppedInto:). THIS
	TECHNIQUE IS NOT RECOMMENDED FOR CASUAL USE."
	self privateRemove: aMorph.
	aMorph privateOwner: self.
	_gsSqueakTemp_dropped := aMorph.
	(_gsSqueakTemp_dropped hasProperty: #addedFlexAtGrab)
		ifTrue: [_gsSqueakTemp_dropped := aMorph removeFlexShell].
	_gsSqueakTemp_event := DropEvent new
				setPosition: self position
				contents: _gsSqueakTemp_dropped
				hand: self.
	["In case of an error, ensure that the morph-to-be-dropped will be
	disposed. Otherwise it may confuse garbage handler. See the sends of
	#privateRemove: and #privateOwner: above."
	_gsSqueakTemp_event := self sendEvent: _gsSqueakTemp_event focus: nil.
	"event filters can apply and filtered events will be returned"
	_gsSqueakTemp_event wasHandled
		ifFalse: [aMorph rejectDropMorphEvent: _gsSqueakTemp_event]]
		ensure: [aMorph owner == self
				ifTrue: [aMorph delete]].
	self mouseOverHandler processMouseOver: anEvent