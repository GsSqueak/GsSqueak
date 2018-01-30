fileIn/Out
moveChangesTo: newFile 
	"Used in the process of condensing changes, this message requests that 
	the source code of all methods of the receiver that have been changed 
	should be moved to newFile."

	| changes |
	changes := self methodDict keys select:
					[:sel | (self compiledMethodAt: sel) fileIndex > 1].
	changes isEmpty ifTrue:
		[^self].
	newFile cr; cr; command: 'H3'; nextChunkPut: self definition; command: '/H3'; cr.
	self
		fileOutChangedMessages: changes
		on: newFile
		moveSource: #historically
		toFile: 2