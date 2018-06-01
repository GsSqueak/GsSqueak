accessing
untranslated
	| translations |
	translations := self translations.
	^self class allKnownPhrases reject: [:each | translations includesKey: each]