scripting access
setAllButFirstCharacter: source 
	"Set all but the first char of the receiver to the source"
	| _gsSqueakTemp_chars |
	(_gsSqueakTemp_chars := self getCharacters) isEmpty
		ifTrue: [self newContents: '·' , source asString]
		ifFalse: [self
				newContents: (String
						streamContents: [:aStream | 
							aStream nextPut: _gsSqueakTemp_chars first.
							aStream nextPutAll: source])]