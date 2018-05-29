as yet unclassified
makeJapaneseTranslationFile
	| t n |
	NaturalLanguageTranslator initializeKnownPhrases.
	t := TranslatedReceiverFinder new senders.
	n := NaturalLanguageTranslator
				localeID: (LocaleID isoLanguage: 'ja').
	t
		do: [:w | 
			NaturalLanguageTranslator registerPhrase: w.
			self
				at: w
				ifPresent: [:k | n phrase: w translation: k]].
	n saveToFileNamed: 'ja.translation'