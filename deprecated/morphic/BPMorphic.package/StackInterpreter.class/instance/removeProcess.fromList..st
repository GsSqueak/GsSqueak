process primitive support
removeProcess: aProcess fromList: aList 
	"Remove a given process from a linked list. May fail if aProcess is not on
	the list."
	| _gsSqueakTemp_firstLink _gsSqueakTemp_lastLink _gsSqueakTemp_nextLink _gsSqueakTemp_tempLink |
	self
		deny: (objectMemory isForwarded: aProcess).
	self
		deny: (objectMemory isForwarded: aList).
	_gsSqueakTemp_firstLink := objectMemory fetchPointer: FirstLinkIndex ofObject: aList.
	_gsSqueakTemp_lastLink := objectMemory fetchPointer: LastLinkIndex ofObject: aList.
	self
		deny: (objectMemory isForwarded: _gsSqueakTemp_firstLink).
	self
		deny: (objectMemory isForwarded: _gsSqueakTemp_lastLink).
	aProcess = _gsSqueakTemp_firstLink
		ifTrue: [_gsSqueakTemp_nextLink := objectMemory fetchPointer: NextLinkIndex ofObject: aProcess.
			self
				deny: (objectMemory isForwarded: _gsSqueakTemp_nextLink).
			objectMemory
				storePointer: FirstLinkIndex
				ofObject: aList
				withValue: _gsSqueakTemp_nextLink.
			aProcess = _gsSqueakTemp_lastLink
				ifTrue: [objectMemory
						storePointerUnchecked: LastLinkIndex
						ofObject: aList
						withValue: objectMemory nilObject]]
		ifFalse: [_gsSqueakTemp_tempLink := _gsSqueakTemp_firstLink.
			[self
				deny: (objectMemory isForwarded: _gsSqueakTemp_tempLink).
			_gsSqueakTemp_tempLink = objectMemory nilObject
				ifTrue: [self primitiveFail.
					^ self].
			_gsSqueakTemp_nextLink := objectMemory fetchPointer: NextLinkIndex ofObject: _gsSqueakTemp_tempLink.
			_gsSqueakTemp_nextLink = aProcess]
				whileFalse: [_gsSqueakTemp_tempLink := objectMemory fetchPointer: NextLinkIndex ofObject: _gsSqueakTemp_tempLink].
			_gsSqueakTemp_nextLink := objectMemory fetchPointer: NextLinkIndex ofObject: aProcess.
			objectMemory
				storePointer: NextLinkIndex
				ofObject: _gsSqueakTemp_tempLink
				withValue: _gsSqueakTemp_nextLink.
			aProcess = _gsSqueakTemp_lastLink
				ifTrue: [objectMemory
						storePointer: LastLinkIndex
						ofObject: aList
						withValue: _gsSqueakTemp_tempLink]].
	objectMemory
		storePointer: NextLinkIndex
		ofObject: aProcess
		withValue: objectMemory nilObject