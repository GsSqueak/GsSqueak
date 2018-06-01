object memory support
postGCUpdateDisplayBits
	"Update the displayBits after a GC may have moved it.
	Answer if the displayBits appear valid"
	| _gsSqueakTemp_displayObj _gsSqueakTemp_bitsOop _gsSqueakTemp_bitsNow |
	_gsSqueakTemp_displayObj := objectMemory splObj: TheDisplay.
	((objectMemory isPointers: _gsSqueakTemp_displayObj)
			and: [(objectMemory lengthOf: _gsSqueakTemp_displayObj)
						>= 4
					and: [objectMemory isWordsOrBytes: (_gsSqueakTemp_bitsOop := objectMemory fetchPointer: 0 ofObject: _gsSqueakTemp_displayObj)]])
		ifFalse: [^ false].
	(objectMemory hasSpurMemoryManagerAPI
			and: [objectMemory isPinned: _gsSqueakTemp_bitsOop])
		ifFalse: [_gsSqueakTemp_bitsNow := self
						cCode: [objectMemory firstIndexableField: _gsSqueakTemp_bitsOop]
						inSmalltalk: [(objectMemory firstIndexableField: _gsSqueakTemp_bitsOop) asInteger].
			displayBits ~= _gsSqueakTemp_bitsNow
				ifTrue: [displayBits := _gsSqueakTemp_bitsNow.
					self
						ioNoteDisplayChanged: displayBits
						width: displayWidth
						height: displayHeight
						depth: displayDepth]].
	^ true