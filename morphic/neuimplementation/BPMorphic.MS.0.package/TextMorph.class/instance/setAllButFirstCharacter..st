scripting access
setAllButFirstCharacter: source 
	"Set all but the first char of the receiver to the source"
	| _gsSqueakTemp_aChar _gsSqueakTemp_chars |
	_gsSqueakTemp_aChar := source asCharacter.
	(_gsSqueakTemp_chars := self getCharacters) isEmpty
		ifTrue: [self newContents: '·' , source asString]
		ifFalse: [_gsSqueakTemp_chars first = _gsSqueakTemp_aChar
				ifFalse: [""
					self
						newContents: (String
								streamContents: [:aStream | 
									aStream nextPut: _gsSqueakTemp_chars first.
									aStream nextPutAll: source])]]