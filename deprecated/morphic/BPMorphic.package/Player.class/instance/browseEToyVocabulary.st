misc
browseEToyVocabulary
	"Open a protocol browser on the receiver, showing its etoy vocabulary"
	| _gsSqueakTemp_littleMe |
	_gsSqueakTemp_littleMe := self assureUniClass.
	(InstanceBrowser new useVocabulary: Vocabulary eToyVocabulary)
		openOnObject: _gsSqueakTemp_littleMe
		showingSelector: nil