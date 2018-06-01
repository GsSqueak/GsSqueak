translation
removeTranslationFor: phraseString
	self generics removeKey: phraseString ifAbsent: [].
	self changed: #translations.
	self changed: #untranslated.