access
fileIndex
	SourceFiles withIndexDo: [:sf :i| sf name = file name ifTrue: [^i]].
	^nil