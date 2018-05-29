private store-retrieve
mergeTranslations: newTranslations
	"Merge a new set of translations into the exiting table.
	Overwrites existing entries."

	newTranslations keysAndValuesDo: [:key :value |
		self rawPhrase: (self class registeredPhraseFor: key) translation: value].
	self changed: #translations.
	self changed: #untranslated.