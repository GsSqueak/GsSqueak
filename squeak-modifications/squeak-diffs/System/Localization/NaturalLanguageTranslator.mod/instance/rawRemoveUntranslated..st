translation
rawRemoveUntranslated: untranslated

	self class allKnownPhrases removeKey: untranslated ifAbsent: [].
	self changed: #untranslated.