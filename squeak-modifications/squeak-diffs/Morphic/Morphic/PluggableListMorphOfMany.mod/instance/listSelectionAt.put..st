drawing
listSelectionAt: index put: value
	setSelectionListSelector ifNil:[^false].
	^model perform: setSelectionListSelector with: index with: value