private
put: aText 
	"Private - put the supplied text onto the file"
	| _gsSqueakTemp_ff _gsSqueakTemp_type _gsSqueakTemp_newName |
	brevityState == #fullFile
		ifTrue: [_gsSqueakTemp_ff := directory newFileNamed: self fullName.
			Cursor write
				showWhile: [_gsSqueakTemp_ff nextPutAll: aText asString;
						 close].
			(directory = _gsSqueakTemp_ff directory
					and: [fileName = _gsSqueakTemp_ff localName])
				ifTrue: [contents := aText asString]
				ifFalse: ["user changed the directory and/or renamed the file"
					self clearUserEditFlag.
					directory ~= _gsSqueakTemp_ff directory
						ifTrue: [self directory: _gsSqueakTemp_ff directory.
							self changed: #rootDirectoryList;
								 changed: #selectedPath].
					self updateFileList.
					contents := aText asString.
					_gsSqueakTemp_newName := _gsSqueakTemp_ff localName.
					listIndex := list
								findFirst: [:item | (self fileNameFromFormattedItem: item)
										= _gsSqueakTemp_newName].
					listIndex > 0
						ifTrue: [fileName := _gsSqueakTemp_newName].
					brevityState := #needToGetBrief.
					self changed: #fileListIndex].
			self changed: #relabel.
			^ true"accepted"].
	listIndex = 0
		ifTrue: [self inform: 'No fileName is selected' translated.
			^ false"failed"].
	_gsSqueakTemp_type := 'These'.
	brevityState = #briefFile
		ifTrue: [_gsSqueakTemp_type := 'Abbreviated'].
	brevityState = #briefHex
		ifTrue: [_gsSqueakTemp_type := 'Abbreviated'].
	brevityState = #fullHex
		ifTrue: [_gsSqueakTemp_type := 'Hexadecimal'].
	brevityState = #FileList
		ifTrue: [_gsSqueakTemp_type := 'Directory'].
	self
		inform: ('{1} contents cannot
meaningfully be saved at present.' translated format: {_gsSqueakTemp_type translated}).
	^ false"failed"