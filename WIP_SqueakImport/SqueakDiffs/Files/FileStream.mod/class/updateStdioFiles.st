stdio
updateStdioFiles
	"Make sure that all existing stdio files are instances of #stdioStreamClass."

	StdioFiles ifNil: [ ^self ].
	Stdin := Stdout := Stderr := nil.
	StdioFiles := StdioFiles collect: [ :file |
		file ifNotNil: [
			file class == self stdioStreamClass
				ifTrue: [ file ]
				ifFalse: [
					self stdioStreamClass newForStdio
						copyFrom: file;
						yourself ] ] ]
