events-processing
handleKeystroke: anEvent
	"Overwritten to support tab-among-fields preference."

	| pasteUp |
	anEvent wasHandled ifTrue:[^self].
	(self handlesKeyboard: anEvent) ifFalse: [^ self].

	anEvent keyCharacter = Character tab ifTrue: [
		"Allow passing through text morph inside pasteups"
		(self wouldAcceptKeyboardFocusUponTab
			and: [(pasteUp := self pasteUpMorphHandlingTabAmongFields) notNil])
				ifTrue: [
					anEvent wasHandled: true.
					^ pasteUp tabHitWithEvent: anEvent]].
	
	^ super handleKeystroke: anEvent