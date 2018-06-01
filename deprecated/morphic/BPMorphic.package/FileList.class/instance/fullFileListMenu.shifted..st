file list menu
fullFileListMenu: aMenu shifted: aBoolean 
	"Fill the menu with all possible items for the file list pane, regardless of
	selection. "
	| _gsSqueakTemp_lastProvider |
	aMenu title: 'all possible file operations' translated.
	aMenu addStayUpItemSpecial.
	_gsSqueakTemp_lastProvider := nil.
	(self itemsForFile: self fullName)
		do: [:svc | 
			(_gsSqueakTemp_lastProvider notNil
					and: [svc provider ~~ _gsSqueakTemp_lastProvider])
				ifTrue: [aMenu addLine].
			svc addServiceFor: self toMenu: aMenu.
			Smalltalk isMorphic
				ifTrue: [aMenu submorphs last setBalloonText: svc description].
			_gsSqueakTemp_lastProvider := svc provider.
			svc addDependent: self].
	^ aMenu