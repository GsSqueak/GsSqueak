file primitives
primitiveFileRename

	| oldNamePointer newNamePointer f |
	oldNamePointer := self stackTop.
	newNamePointer := self stackValue: 1.
	self success: (objectMemory isBytes: oldNamePointer).
	self success: (objectMemory isBytes: newNamePointer).
	self success: (StandardFileStream isAFileNamed: (self stringOf: oldNamePointer)).
	self success: (StandardFileStream isAFileNamed: (self stringOf: newNamePointer)) not.
	self successful ifTrue: [
		f := FileStream oldFileNamed: (self stringOf: oldNamePointer).
		f rename: (self stringOf: newNamePointer).
		f close.
	].
	self successful ifTrue: [
		self pop: 2.  "oldName, newName; leave rcvr on stack"
	].