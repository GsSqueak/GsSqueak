menu
holderForCharacters
	"Hand the user a Holder that is populated with individual text morphs
	representing my characters"
	| _gsSqueakTemp_aHolder |
	_gsSqueakTemp_aHolder := ScriptingSystem prototypicalHolder.
	_gsSqueakTemp_aHolder setNameTo: 'H' , self externalName.
	text string
		do: [:aChar | _gsSqueakTemp_aHolder
				addMorphBack: (TextMorph new contents: aChar asText)].
	_gsSqueakTemp_aHolder setProperty: #donorTextMorph toValue: self.
	_gsSqueakTemp_aHolder fullBounds.
	_gsSqueakTemp_aHolder openInHand