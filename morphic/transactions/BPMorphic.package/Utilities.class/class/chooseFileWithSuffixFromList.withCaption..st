summer97 additions
chooseFileWithSuffixFromList: aSuffixList withCaption: aCaption 
	"Pop up a list of all files in the default directory which have a suffix in
	the list. Return #none if there are none; return nil if the user backs
	out of the menu without making a choice."
	"Utilities chooseFileWithSuffixFromList: #('.gif' '.jpg')"
	| _gsSqueakTemp_aList _gsSqueakTemp_aName |
	_gsSqueakTemp_aList := OrderedCollection new.
	aSuffixList
		do: [:aSuffix | _gsSqueakTemp_aList
				addAll: (FileDirectory default fileNamesMatching: '*' , aSuffix)].
	^ _gsSqueakTemp_aList size > 0
		ifTrue: [_gsSqueakTemp_aName := UIManager default
						chooseFrom: _gsSqueakTemp_aList
						values: _gsSqueakTemp_aList
						title: aCaption.
			_gsSqueakTemp_aName]
		ifFalse: [#none]