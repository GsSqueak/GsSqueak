*SqClasses-fileIn/Out
printCategoryChunk: category on: aFileStream priorMethod: priorMethod
	^ self printCategoryChunk: category on: aFileStream
		withStamp: Utilities changeStamp priorMethod: priorMethod
