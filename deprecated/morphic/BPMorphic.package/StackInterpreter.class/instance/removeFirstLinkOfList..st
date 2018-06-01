process primitive support
removeFirstLinkOfList: aList 
	"Remove the first process from the given linked list."
	| _gsSqueakTemp_first _gsSqueakTemp_last _gsSqueakTemp_next |
	self
		deny: (objectMemory isForwarded: aList).
	_gsSqueakTemp_first := objectMemory fetchPointer: FirstLinkIndex ofObject: aList.
	_gsSqueakTemp_last := objectMemory fetchPointer: LastLinkIndex ofObject: aList.
	self
		deny: (objectMemory isForwarded: _gsSqueakTemp_first).
	self
		deny: (objectMemory isForwarded: _gsSqueakTemp_last).
	_gsSqueakTemp_first = _gsSqueakTemp_last
		ifTrue: [objectMemory
				storePointerUnchecked: FirstLinkIndex
				ofObject: aList
				withValue: objectMemory nilObject;
				
				storePointerUnchecked: LastLinkIndex
				ofObject: aList
				withValue: objectMemory nilObject]
		ifFalse: [_gsSqueakTemp_next := objectMemory fetchPointer: NextLinkIndex ofObject: _gsSqueakTemp_first.
			objectMemory
				storePointer: FirstLinkIndex
				ofObject: aList
				withValue: _gsSqueakTemp_next].
	objectMemory
		storePointerUnchecked: NextLinkIndex
		ofObject: _gsSqueakTemp_first
		withValue: objectMemory nilObject.
	^ _gsSqueakTemp_first