I/O primitives
primitiveClipboardText
	"When called with a single string argument, post the string to 
	the clipboard. When called with zero arguments, return a 
	string containing the current clipboard contents."
	| _gsSqueakTemp_s _gsSqueakTemp_sz |
	argumentCount = 1
		ifTrue: [_gsSqueakTemp_s := self stackTop.
			(objectMemory isBytes: _gsSqueakTemp_s)
				ifFalse: [^ self primitiveFail].
			self successful
				ifTrue: [_gsSqueakTemp_sz := objectMemory numBytesOfBytes: _gsSqueakTemp_s.
					self
						clipboardWrite: _gsSqueakTemp_sz
						From: _gsSqueakTemp_s + objectMemory baseHeaderSize
						At: 0.
					self pop: 1]]
		ifFalse: [_gsSqueakTemp_sz := self clipboardSize.
			objectMemory hasSpurMemoryManagerAPI
				ifTrue: [_gsSqueakTemp_s := objectMemory allocateBytes: _gsSqueakTemp_sz classIndex: ClassByteStringCompactIndex.
					_gsSqueakTemp_s
						ifNil: [^ self primitiveFail]]
				ifFalse: [(objectMemory sufficientSpaceToAllocate: _gsSqueakTemp_sz)
						ifFalse: [^ self primitiveFail].
					_gsSqueakTemp_s := objectMemory
								instantiateClass: (objectMemory splObj: ClassByteString)
								indexableSize: _gsSqueakTemp_sz].
			self
				clipboardRead: _gsSqueakTemp_sz
				Into: _gsSqueakTemp_s + objectMemory baseHeaderSize
				At: 0.
			self pop: 1 thenPush: _gsSqueakTemp_s]