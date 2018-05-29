menu
readFromDisk: evt
	| menu |
	menu := MenuMorph new.
	(FileDirectory default fileNamesMatching: '*.fmp') do:
		[:fileName |
		menu add: fileName
			target: self selector: #readFileNamed:
			argument: fileName].
	menu popUpEvent: evt in: self world