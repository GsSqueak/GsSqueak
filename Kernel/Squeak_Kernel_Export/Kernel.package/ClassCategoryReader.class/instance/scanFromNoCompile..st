fileIn/Out
scanFromNoCompile: aStream 
	"Just move the source code for the methods from aStream."
	| methodText selector |

	[methodText := aStream nextChunkText.
	 methodText size > 0]
		whileTrue:
		[(SourceFiles at: 2) ifNotNil: [
			selector := class newParser parseSelector: methodText.
			(class compiledMethodAt: selector) putSource: methodText 
				fromParseNode: nil class: class category: category
				withStamp: changeStamp inFile: 2 priorMethod: nil]]