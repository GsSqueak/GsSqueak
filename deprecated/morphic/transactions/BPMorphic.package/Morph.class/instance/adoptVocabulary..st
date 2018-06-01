-Etoys-support
adoptVocabulary: aVocabulary 
	"Make aVocabulary be the one used by me and my submorphs"
	self
		submorphsDo: [:m | m adoptVocabulary: aVocabulary]