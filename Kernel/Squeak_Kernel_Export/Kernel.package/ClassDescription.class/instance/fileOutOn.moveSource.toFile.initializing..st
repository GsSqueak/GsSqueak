fileIn/Out
fileOutOn: aFileStream moveSource: moveSource toFile: fileIndex initializing: aBool
	"File out the receiver. Backstop for subclasses."
	^self fileOutOn: aFileStream moveSource: moveSource toFile: fileIndex