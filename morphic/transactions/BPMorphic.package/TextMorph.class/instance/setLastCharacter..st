accessing
setLastCharacter: source 
	"Set the last character of the receiver as indicated"
	| _gsSqueakTemp_aChar _gsSqueakTemp_chars |
	_gsSqueakTemp_aChar := source asCharacter.
	(_gsSqueakTemp_chars := self getCharacters) size > 0
		ifTrue: [_gsSqueakTemp_chars last = _gsSqueakTemp_aChar
				ifFalse: [self
						newContents: (String
								streamContents: [:aStream | 
									aStream
										nextPutAll: (_gsSqueakTemp_chars copyFrom: 1 to: _gsSqueakTemp_chars size - 1).
									aStream nextPut: _gsSqueakTemp_aChar])]]
		ifFalse: [self
				newContents: (String with: _gsSqueakTemp_aChar)]