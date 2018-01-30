fileIn/Out
fileOutChangedMessages: aSet on: aFileStream moveSource: moveSource toFile: fileIndex 
	"File a description of the messages of this class that have been 
	changed (i.e., are entered into the argument, aSet) onto aFileStream.  If 
	moveSource, is true, then set the method source pointer to the new file position.
	Note when this method is called with moveSource=true, it is condensing the
	.changes file, and should only write a preamble for every method."
	| org |
	(org := self organization) categories do: 
		[:cat |  | sels |
		sels := (org listAtCategoryNamed: cat) select: [:sel | aSet includes: sel].
		(moveSource == #historically
		 or: [moveSource and: [(cat beginsWith: '*') and: [cat endsWith: '-override']]])
			ifTrue: "when condensing sources/changes, preserve overridden methods"
				[sels do:
					[:sel |
					self printMethodChunkHistorically: sel on: aFileStream
						moveSource: moveSource ~~ false toFile: fileIndex]]
			ifFalse:
				[sels do:
					[:sel |  self printMethodChunk: sel withPreamble: true on: aFileStream
						moveSource: moveSource toFile: fileIndex]]]