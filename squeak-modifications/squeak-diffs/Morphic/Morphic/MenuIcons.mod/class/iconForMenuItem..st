menu decoration
iconForMenuItem: anItem
	"Answer the icon (or nil) corresponding to the (translated) string."

	^TranslatedIcons at: anItem contents asString asLowercase ifAbsent: [ ]