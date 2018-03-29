image save/restore
getWord32FromFile: aFile swap: swapFlag 
	"Answer the next 32 bit word read from aFile, byte-swapped according
	to the swapFlag."
	| _gsSqueakTemp_w |
	_gsSqueakTemp_w := 0.
	self
		cCode: [self
				sq: (self addressOf: _gsSqueakTemp_w)
				Image: (self sizeof: #int)
				File: 1
				Read: aFile]
		inSmalltalk: [_gsSqueakTemp_w := objectMemory nextWord32From: aFile].
	^ swapFlag
		ifTrue: [_gsSqueakTemp_w byteSwap32]
		ifFalse: [_gsSqueakTemp_w]