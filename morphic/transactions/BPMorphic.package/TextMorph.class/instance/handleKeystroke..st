events-processing
handleKeystroke: anEvent 
	"Overwritten to support tab-among-fields preference."
	| _gsSqueakTemp_pasteUp |
	anEvent wasHandled
		ifTrue: [^ self].
	(self handlesKeyboard: anEvent)
		ifFalse: [^ self].
	anEvent keyCharacter = Character tab
		ifTrue: ["Allow passing through text morph inside pasteups"
			(self wouldAcceptKeyboardFocusUponTab
					and: [(_gsSqueakTemp_pasteUp := self pasteUpMorphHandlingTabAmongFields) notNil])
				ifTrue: [anEvent wasHandled: true.
					^ _gsSqueakTemp_pasteUp tabHitWithEvent: anEvent]].
	^ super handleKeystroke: anEvent