image save/restore
getLongFromFile: aFile swap: swapFlag 
	"Answer the next 32 or 64 bit word read from aFile, byte-swapped
	according to the swapFlag."
	| _gsSqueakTemp_w |
	_gsSqueakTemp_w := 0.
	self
		cCode: [self
				sq: (self addressOf: _gsSqueakTemp_w)
				Image: (self sizeof: _gsSqueakTemp_w)
				File: 1
				Read: aFile]
		inSmalltalk: [_gsSqueakTemp_w := objectMemory nextLongFrom: aFile].
	^ swapFlag
		ifTrue: [objectMemory byteSwapped: _gsSqueakTemp_w]
		ifFalse: [_gsSqueakTemp_w]