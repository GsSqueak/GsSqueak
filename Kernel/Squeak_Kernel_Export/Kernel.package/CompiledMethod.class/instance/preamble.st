printing
preamble
	"Return the preamble of this method stored in the source files."

	^SourceFiles
		fileIndexAndPositionFromSourcePointer: self sourcePointer
		do: [ :fileIndex :filePosition |
			fileIndex = 0
				ifTrue: [ String new "no source pointer for this method" ]
				ifFalse: [
					(CurrentReadOnlySourceFiles at: fileIndex)
						ifNil: [ String new "sources file not available" ]
						ifNotNil: [ :file |
							self
								getPreambleFrom: file
								at: (0 max: filePosition - 3) ] ] ]