scraps
scrapBook
	| header aButton label |
	^ book ifNil: [
		book := BookMorph new pageSize: 200@300; setNameTo: 'scraps' translated.
		book color: Color yellow muchLighter.
		book borderColor: Color darkGray; borderWidth: 2.
		book removeEverything; showPageControls; insertPage.
		header := AlignmentMorph newRow wrapCentering: #center; cellPositioning: #leftCenter.
		header setProperty: #header toValue: true.
		header addMorph: (aButton := SimpleButtonMorph new label: 'O' font: Preferences standardButtonFont).
		aButton target: book;
			color:  Color tan;
			actionSelector: #delete;
			setBalloonText: 'Close the trashcan.\(to view again later, click on any trashcan).' withCRs translated.

		header addMorphBack: AlignmentMorph newVariableTransparentSpacer beSticky.
		header addMorphBack: 	(label := UpdatingStringMorph new target: self) beSticky.
		label getSelector: #trashTitle; useStringFormat; step.
		header addMorphBack: AlignmentMorph newVariableTransparentSpacer beSticky.
		header addMorphBack: (aButton := SimpleButtonMorph new label: 'E' translated font: Preferences standardButtonFont).
		aButton target: self; color:  Color veryLightGray; actionSelector: #maybeEmptyTrash;
			setBalloonText: 'Click here to empty the trash.' translated.
		book currentPage addMorph: (TextMorph new contents: 'Objects you drag into the trash will automatically be saved here, one object per page, in case you need them later.  To disable this feature set the "preserveTrash" Preference to false.\\You can individually expunge objects by hitting the - control, and you can empty out all the objects in the trash can by hitting the "E" button at top right.' withCRs translated
		wrappedTo: 190).

		book addMorphFront: header.
		book setProperty: #scraps toValue: true].