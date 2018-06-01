basic control sequence
readKeyboard
	"Keyboard support for menus. ESC will abort the menu, Space or CR
	will select an item. Cursor up and cursor down will change the
	selection. Any other key will either select an item whose label starts
	with that character or select the next matching label.
	Answer true if the menu should be closed and false otherwise."

	| ch labels occurences |
	ch := Sensor keyboard asciiValue.
	(ch = 13 or: [ch = 32]) ifTrue: [^ true].
	ch = 27 ifTrue: [self setSelection: 0. ^ true].
	ch = 30
		ifTrue:
			[self setSelection: (selection <= 1
				ifTrue: [self nItems]
				ifFalse: [selection - 1])].
	ch = 31 ifTrue: [self setSelection: selection \\ self nItems + 1].
	ch := ch asCharacter asLowercase.
	labels := labelString lines.
	occurences := 0.
	1 + selection to: selection + labels size do:
		[:index |
		| i | i := index - 1 \\ labels size + 1.
		(labels at: i) withBlanksTrimmed first asLowercase = ch
			ifTrue: [(occurences := occurences + 1) = 1 ifTrue: [self setSelection: i]]].
	^ occurences = 1