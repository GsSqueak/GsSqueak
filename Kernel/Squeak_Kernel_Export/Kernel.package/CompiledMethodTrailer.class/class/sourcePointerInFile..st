as yet unclassified
sourcePointerInFile: fileIndex

	^self new
		sourcePointer: (SourceFiles
			sourcePointerFromFileIndex: fileIndex
			andPosition: (SourceFiles at: fileIndex) position);
		yourself
		