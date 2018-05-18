initialization
acceptNameEdit
	"If the name is currently under edit, accept the changes"

	| label |
	(label := self findA: NameStringInHalo) ifNotNil:
		[label hasFocus ifTrue:
			[label lostFocusWithoutAccepting]]