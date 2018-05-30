class initialization
privateStartUp
	self resetCaches.
	GetTextTranslator privateStartUp.
	InternalTranslator privateStartUp.
	self localeChanged.