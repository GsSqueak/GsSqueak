private
registeredPhraseFor: phrase
	"Using a Dictionary so we can lookup existing string instead of creating needless copies when loading a translation."
	^self allKnownPhrases at: phrase ifAbsentPut: [phrase]