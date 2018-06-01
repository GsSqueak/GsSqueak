menu
readFileNamed: fileName
	| snd |
	snd := Compiler evaluate:
		(FileStream readOnlyFileNamed: fileName) contentsOfEntireFile.
	soundName := fileName copyFrom: 1 to: fileName size-4. "---.fmp"
	self editSound: snd