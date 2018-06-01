miscellaneous
storeTextWindowContentsToFileNamed: aName 
	"Utilities storeTextWindowContentsToFileNamed: 'TextWindows'"
	| _gsSqueakTemp_aDict _gsSqueakTemp_aRefStream |
	_gsSqueakTemp_aDict := Project current textWindows.
	_gsSqueakTemp_aDict size = 0
		ifTrue: [^ self inform: 'no windows found to export.'].
	_gsSqueakTemp_aRefStream := ReferenceStream fileNamed: aName.
	_gsSqueakTemp_aRefStream nextPut: _gsSqueakTemp_aDict.
	_gsSqueakTemp_aRefStream close.
	self inform: 'Done!  ' , _gsSqueakTemp_aDict size printString , ' window(s) exported.'