drawing
listSelectionAt: index
	getSelectionListSelector ifNil:[^false].
	^model perform: getSelectionListSelector with: index