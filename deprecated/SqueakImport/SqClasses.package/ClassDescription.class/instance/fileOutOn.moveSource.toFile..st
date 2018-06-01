*SqClasses-fileIn/Out
fileOutOn: aFileStream moveSource: moveSource toFile: fileIndex
	"File a description of the receiver on aFileStream.  moveSOurce is one of
	 true, false or #historically.  If the argument, moveSource, is not false, then
	 set the trailing bytes to the position of aFileStream and to fileIndex in order
	 to indicate where to find the source code.  If moveSource == #historically,
	 print out each method's history, excluding branches"

	aFileStream command: 'H3'; nextChunkPut: self definition; command: '/H3'.

	self organization
		putCommentOnFile: aFileStream
		numbered: fileIndex
		moveSource: moveSource ~~ false
		forClass: self.
	self organization categories do: 
		[:heading |
		moveSource == #historically
			ifTrue:
				[self fileOutCategoryHistorically: heading
					on: aFileStream
					moveSource: true
					toFile: fileIndex]
			ifFalse:
				[self fileOutCategory: heading
					on: aFileStream
					moveSource: moveSource
					toFile: fileIndex]]
