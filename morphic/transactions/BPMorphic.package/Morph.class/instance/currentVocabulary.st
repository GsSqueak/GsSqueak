-Etoys
currentVocabulary
	"Answer the receiver's current vocabulary"
	^ (self ownerThatIsA: StandardViewer orA: ScriptEditorMorph)
		ifNil: [super currentVocabulary]
		ifNotNil: [:_gsSqueakTemp_outer | _gsSqueakTemp_outer currentVocabulary]