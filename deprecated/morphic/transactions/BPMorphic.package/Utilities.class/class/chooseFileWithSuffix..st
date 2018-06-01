summer97 additions
chooseFileWithSuffix: aSuffix 
	"Utilities chooseFileWithSuffix: '.gif'"
	| _gsSqueakTemp_aList _gsSqueakTemp_aName |
	_gsSqueakTemp_aList := FileDirectory default fileNamesMatching: '*' , aSuffix.
	_gsSqueakTemp_aList size > 0
		ifTrue: [_gsSqueakTemp_aName := UIManager default
						chooseFrom: _gsSqueakTemp_aList
						values: _gsSqueakTemp_aList
						title: 'Choose a file'.
			^ _gsSqueakTemp_aName]
		ifFalse: [self inform: 'Sorry, there are no files
whose names end with "' , aSuffix , '".'.
			^ nil]