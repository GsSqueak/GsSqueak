scripting access
setAllButFirstCharacter: source 
	"Set all but the first char of the receiver to the source"
	| chars |
	(chars := self getCharacters) isEmpty
		ifTrue: [self newContents: '·' , source asString]
		ifFalse: [self newContents: (String
								streamContents: [:aStream | 
									aStream nextPut: chars first.
									aStream nextPutAll: source])]