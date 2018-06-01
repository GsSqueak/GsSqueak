private store-retrieve
processExternalObject: anArray 
	"pivate - process the external object"

	"new format -> {translations. untranslated}"

	anArray second do: [:each | self class registerPhrase: each].

	self mergeTranslations: anArray first