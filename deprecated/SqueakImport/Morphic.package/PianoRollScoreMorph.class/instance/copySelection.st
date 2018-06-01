editing
copySelection
	selection isNil ifTrue: [^self].
	NotePasteBuffer := (score tracks at: selection first) 
				copyFrom: selection second
				to: selection third