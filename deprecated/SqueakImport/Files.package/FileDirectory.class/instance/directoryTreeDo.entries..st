enumeration
directoryTreeDo: oneArgBlock entries: entriesCollection 
	"Value oneArgBlock with the path (an OrderedCollection of FileDirectory's) to each DirectoryEntry and the DirectoryEntry itself."

	self entriesDo:  [ :entry | 
		entriesCollection addLast: entry.
		oneArgBlock value: entriesCollection.
		entry isDirectory ifTrue: [
			entry asFileDirectory
				directoryTreeDo: oneArgBlock
				entries: entriesCollection ].
		entriesCollection removeLast ]