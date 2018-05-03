summer97 additions
chooseFileWithSuffixFromList: aSuffixList withCaption: aCaption
	"Pop up a list of all files in the default directory which have a suffix in the list.  Return #none if there are none; return nil if the user backs out of the menu without making a choice."
	"Utilities chooseFileWithSuffixFromList: #('.gif' '.jpg')"
	| aList aName |
	aList := OrderedCollection new.
	aSuffixList do:
		[:aSuffix | aList addAll: (FileDirectory default fileNamesMatching: '*', aSuffix)].
	^ aList size > 0
		ifTrue:
			[aName := UIManager default chooseFrom: aList values: aList title: aCaption.
			aName]
		ifFalse:
			[#none]