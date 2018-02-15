initialization
acceptNameEdit
	"If the name is currently under edit, accept the changes"
	(self findA: NameStringInHalo)
		ifNotNil: [:_gsSqueakTemp_label | _gsSqueakTemp_label hasFocus
				ifTrue: [_gsSqueakTemp_label lostFocusWithoutAccepting]]