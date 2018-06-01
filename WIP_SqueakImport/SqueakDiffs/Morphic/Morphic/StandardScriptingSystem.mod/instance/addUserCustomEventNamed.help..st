*Morphic-Etoys-customevents-custom events
addUserCustomEventNamed: aSymbol help: helpString
	self currentWorld addUserCustomEventNamed: aSymbol help: helpString.
	"Vocabulary addStandardVocabulary: UserCustomEventNameType new."
	Vocabulary customEventsVocabulary.
	SymbolListTile updateAllTilesForVocabularyNamed: #CustomEvents