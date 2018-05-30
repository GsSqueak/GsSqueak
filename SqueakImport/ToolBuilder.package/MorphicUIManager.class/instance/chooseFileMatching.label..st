ui requests
chooseFileMatching: patterns label: aString
	"Let the user choose a file matching the given patterns"
	| result |
	result := FileChooserDialog openOnPattern: patterns label: aString.
	^result