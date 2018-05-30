snapshot and quit
saveAsSuggesting: aName
	"Put up the 'saveAs' prompt, obtain a name, and save the image  under that new name."
	^self saveAs: (self getFileNameFromUserSuggesting: aName)
