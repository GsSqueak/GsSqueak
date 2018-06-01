file directory
fullNameFor: aString 
"Return a corrected, fully-qualified name for the given file name."
	^ self urlFromServer: self server directories: self directories , {aString}