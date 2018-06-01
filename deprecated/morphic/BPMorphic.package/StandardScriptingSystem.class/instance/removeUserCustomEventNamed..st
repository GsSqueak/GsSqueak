-Etoys-customevents-custom events
removeUserCustomEventNamed: eventName 
	| _gsSqueakTemp_retval |
	_gsSqueakTemp_retval := self currentWorld removeUserCustomEventNamed: eventName.
	"Vocabulary addStandardVocabulary: UserCustomEventNameType
	new. "
	Vocabulary customEventsVocabulary.
	SymbolListTile updateAllTilesForVocabularyNamed: #CustomEvents.
	^ _gsSqueakTemp_retval