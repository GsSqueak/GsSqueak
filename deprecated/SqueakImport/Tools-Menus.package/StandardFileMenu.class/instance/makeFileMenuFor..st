menu building
makeFileMenuFor: aDirectory
"Initialize an instance of me to operate on aDirectory"

	| theMenu |
	pattern ifNil: [pattern := {'*'}].
	Cursor wait showWhile: 
		[self 
			labels: 	(self menuLabelsString: aDirectory)
			font: 	(MenuStyle fontAt: 1) 
			lines: 	(self menuLinesArray: aDirectory).
		theMenu := self selections: (self menuSelectionsArray: aDirectory)].
	^theMenu