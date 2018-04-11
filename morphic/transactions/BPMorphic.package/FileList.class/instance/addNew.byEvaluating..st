file menu action
addNew: aString byEvaluating: aBlock 
	"A parameterization of earlier versions of #addNewDirectory and
	#addNewFile. Fixes the bug in each that pushing the cancel button
	in the FillInTheBlank dialog gave a walkback."
	| _gsSqueakTemp_response _gsSqueakTemp_newName _gsSqueakTemp_index _gsSqueakTemp_ending |
	self okToChange
		ifFalse: [^ self].
	(_gsSqueakTemp_response := UIManager default
					request: ('New {1} Name?' translated format: {aString translated})
					initialAnswer: ('{1}Name' translated format: {aString translated})) isEmpty
		ifTrue: [^ self].
	_gsSqueakTemp_newName := _gsSqueakTemp_response asFileName.
	Cursor wait
		showWhile: [aBlock value: _gsSqueakTemp_newName].
	self updateFileList.
	_gsSqueakTemp_index := list indexOf: _gsSqueakTemp_newName.
	_gsSqueakTemp_index = 0
		ifTrue: [_gsSqueakTemp_ending := ') ' , _gsSqueakTemp_newName.
			_gsSqueakTemp_index := list
						findFirst: [:line | line endsWith: _gsSqueakTemp_ending]].
	self fileListIndex: _gsSqueakTemp_index