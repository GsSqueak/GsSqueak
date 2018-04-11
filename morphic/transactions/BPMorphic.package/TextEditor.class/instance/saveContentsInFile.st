menu messages
saveContentsInFile
	"Save the receiver's contents string to a file, prompting the user for a
	file-name. Suggest a reasonable file-name."
	| _gsSqueakTemp_fileName _gsSqueakTemp_stringToSave _gsSqueakTemp_parentWindow _gsSqueakTemp_labelToUse _gsSqueakTemp_suggestedName |
	_gsSqueakTemp_stringToSave := paragraph text string.
	_gsSqueakTemp_stringToSave size = 0
		ifTrue: [^ self inform: 'nothing to save.'].
	_gsSqueakTemp_parentWindow := model dependents
				detect: [:dep | dep isKindOf: SystemWindow]
				ifNone: [].
	_gsSqueakTemp_labelToUse := _gsSqueakTemp_parentWindow
				ifNil: ['Untitled']
				ifNotNil: [_gsSqueakTemp_parentWindow label].
	_gsSqueakTemp_suggestedName := nil.
	#(#('Decompressed contents of: ' '.gz' ) )
		do: [:leaderTrailer | | lastIndex | "can add more here..."
			(_gsSqueakTemp_labelToUse beginsWith: leaderTrailer first)
				ifTrue: [_gsSqueakTemp_suggestedName := _gsSqueakTemp_labelToUse copyFrom: leaderTrailer first size + 1 to: _gsSqueakTemp_labelToUse size.
					(_gsSqueakTemp_labelToUse endsWith: leaderTrailer last)
						ifTrue: [_gsSqueakTemp_suggestedName := _gsSqueakTemp_suggestedName copyFrom: 1 to: _gsSqueakTemp_suggestedName size - leaderTrailer last size]
						ifFalse: [lastIndex := _gsSqueakTemp_suggestedName lastIndexOf: $..
							lastIndex > 1
								ifTrue: [_gsSqueakTemp_suggestedName := _gsSqueakTemp_suggestedName copyFrom: 1 to: lastIndex - 1]]]].
	_gsSqueakTemp_suggestedName
		ifNil: [_gsSqueakTemp_suggestedName := _gsSqueakTemp_labelToUse , '.text'].
	_gsSqueakTemp_fileName := UIManager default request: 'File name?' initialAnswer: _gsSqueakTemp_suggestedName.
	_gsSqueakTemp_fileName isEmptyOrNil
		ifFalse: [(FileStream newFileNamed: _gsSqueakTemp_fileName) nextPutAll: _gsSqueakTemp_stringToSave;
				 close]