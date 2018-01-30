fileIn/Out
fileOutOn: aFileStream moveSource: moveSource toFile: fileIndex initializing: aBool
	super fileOutOn: aFileStream moveSource: moveSource toFile: fileIndex.
	(aBool
	 and: [moveSource == false
	 and: [self methodDict includesKey: #initialize]]) ifTrue: 
		[aFileStream cr; cr; nextChunkPut: thisClass name , ' initialize'; cr]