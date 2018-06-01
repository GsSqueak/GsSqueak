as yet unclassified
printButton

	^self
		buttonNamed: 'Print' 
		action: #doPrint 
		color: self buttonColor 
		help: 'Print me (a PostScript file will be created)'