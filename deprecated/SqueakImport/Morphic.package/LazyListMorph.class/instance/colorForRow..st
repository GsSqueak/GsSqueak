drawing
colorForRow: row
	
	^(selectedRow notNil and: [ row = selectedRow])
		ifTrue: [ self selectionTextColor ]
		ifFalse: [ self color ].