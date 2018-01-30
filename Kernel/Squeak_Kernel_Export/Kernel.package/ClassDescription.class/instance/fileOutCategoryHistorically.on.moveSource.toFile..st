fileIn/Out
fileOutCategoryHistorically: aSymbol on: aFileStream moveSource: moveSource toFile: fileIndex 
	"File a description of the receiver's category, aString, onto aFileStream, preserving direct
	 history, but excluding branches . If moveSource, is true, then set the method source pointer
	 to the new file position. Note when this method is called with moveSource=true, it is
	 condensing the sources file, and should only write one preamble per method category."

	| selectors |
	aFileStream cr.
	selectors := aSymbol asString = ClassOrganizer allCategory
					ifTrue: [self organization allMethodSelectors]
					ifFalse: [self organization listAtCategoryNamed: aSymbol].

	selectors := selectors select: [:each | self includesLocalSelector: each].
	
	"Overridden to preserve author stamps in sources file regardless."
	selectors do: [:sel |
		self printMethodChunkHistorically: sel
			on: aFileStream 
			moveSource: moveSource 
			toFile: fileIndex]