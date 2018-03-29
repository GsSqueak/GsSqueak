image save/restore
getShortFromFile: aFile swap: swapFlag 
	"Answer the next 16 bit word read from aFile, byte-swapped according
	to the swapFlag."
	| _gsSqueakTemp_w |
	_gsSqueakTemp_w := 0.
	self
		cCode: [self
				sq: (self addressOf: _gsSqueakTemp_w)
				Image: (self sizeof: #'unsigned short')
				File: 1
				Read: aFile]
		inSmalltalk: [_gsSqueakTemp_w := objectMemory nextShortFrom: aFile].
	^ swapFlag
		ifTrue: [(_gsSqueakTemp_w >> 8 bitAnd: 255)
				bitOr: (_gsSqueakTemp_w bitAnd: 255)
						<< 8]
		ifFalse: [_gsSqueakTemp_w]