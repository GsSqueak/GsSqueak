ui requests
chooseFileMatchingSuffixes: suffixList label: aString
	"Let the user choose a file matching the given suffix list"
	| result |
	result := FileChooserDialog openOnSuffixList: suffixList label: aString.
	^result