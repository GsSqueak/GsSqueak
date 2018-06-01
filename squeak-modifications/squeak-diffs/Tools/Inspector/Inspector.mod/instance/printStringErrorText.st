private
printStringErrorText
	| nm |
	nm := self selectionIndex < 3
		ifTrue: ['self']
		ifFalse: [self selectedSlotName].
	^ (nm
		ifNil: ['no selection']
		ifNotNil:
			[nm first isDigit
				ifTrue: ['<error in printString: evaluate "(self at: ' , nm , ') printString" to debug>']
				ifFalse: ['<error in printString: evaluate "' , nm , ' printString" to debug>'] ]) asText