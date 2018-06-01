translation
removeUntranslated: untranslated

	self class allKnownPhrases removeKey: untranslated ifAbsent: [].
