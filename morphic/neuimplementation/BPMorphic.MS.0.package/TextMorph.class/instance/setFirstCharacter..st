accessing
setFirstCharacter: source 
	"Set the first character of the receiver as indicated"
	| _gsSqueakTemp_aChar _gsSqueakTemp_chars |
	_gsSqueakTemp_aChar := source asCharacter.
	(_gsSqueakTemp_chars := self getCharacters) isEmpty
		ifTrue: [self
				newContents: (String with: _gsSqueakTemp_aChar)]
		ifFalse: [_gsSqueakTemp_chars first = _gsSqueakTemp_aChar
				ifFalse: [self
						newContents: (String
								streamContents: [:aStream | 
									aStream nextPut: _gsSqueakTemp_aChar.
									aStream
										nextPutAll: (_gsSqueakTemp_chars copyFrom: 2 to: _gsSqueakTemp_chars size)])]]