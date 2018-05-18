updating
fileNameFormattedFrom: entry sizePad: sizePad 
	"If the short file list flag is false, we send this on to the superclass."

	| nameStr |
	showShortFileNames 
		ifFalse: [^super fileNameFormattedFrom: entry sizePad: sizePad].

	"Otherwise, just show the name of the file in the file list."
	nameStr := (entry isDirectory)
					ifTrue: [entry name, self folderString]
					ifFalse: [entry name].
	^nameStr