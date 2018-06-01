enumeration
directoryTreeDo: oneArgBlock 
	"For each file and directory in my tree, value oneArgBlock with an OrderedCollection of the path of DirectoryEntry's leading to the current node.  The first element in the collection will be the DirectoryEntryDirectory for myself, the last is the currentNode (a DirectoryEntry)."
	|myEntry|
	myEntry := OrderedCollection with: self directoryEntry.
	oneArgBlock value: myEntry.
	self 
		directoryTreeDo: oneArgBlock
		entries: myEntry