menu
holderForCharacters
	"Hand the user a Holder that is populated with individual text morphs representing my characters"

	| aHolder |
	aHolder := ScriptingSystem prototypicalHolder.
	aHolder setNameTo: 'H', self externalName.
	text string do:
		[:aChar |
			aHolder addMorphBack: (TextMorph new contents: aChar asText)].
	aHolder setProperty: #donorTextMorph toValue: self.
	aHolder fullBounds.
	aHolder openInHand