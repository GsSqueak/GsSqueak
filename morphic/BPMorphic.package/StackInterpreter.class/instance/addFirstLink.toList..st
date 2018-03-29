process primitive support
addFirstLink: proc toList: aList 
	"Add the given process to the front of the given linked list
	and set the backpointer of process to its new list."
	| _gsSqueakTemp_firstLink |
	self assert: (objectMemory isForwarded: aList) not.
	self assert: (objectMemory fetchPointer: NextLinkIndex ofObject: proc)
			= objectMemory nilObject.
	_gsSqueakTemp_firstLink := objectMemory fetchPointer: FirstLinkIndex ofObject: aList.
	self assert: _gsSqueakTemp_firstLink ~= proc.
	objectMemory
		storePointer: FirstLinkIndex
		ofObject: aList
		withValue: proc.
	_gsSqueakTemp_firstLink = objectMemory nilObject
		ifTrue: ["a.k.a. (self isEmptyList: aList)"
			objectMemory
				storePointer: LastLinkIndex
				ofObject: aList
				withValue: proc]
		ifFalse: [objectMemory
				storePointer: NextLinkIndex
				ofObject: proc
				withValue: _gsSqueakTemp_firstLink].
	objectMemory
		storePointer: MyListIndex
		ofObject: proc
		withValue: aList