translation
phrase: phraseString translation: translationString 
	self generics at: phraseString put: translationString asString.
	self changed: #translations.
	self changed: #untranslated.