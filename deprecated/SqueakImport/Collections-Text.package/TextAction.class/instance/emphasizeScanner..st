accessing
emphasizeScanner: scanner
	"Set the emphasis for text display"
	Purple ifNil: [Purple := self userInterfaceTheme color ifNil: [Color r: 0.4 g: 0.0 b: 1]].
	scanner textColor: Purple.