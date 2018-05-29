keyboard
nextCharFrom: sensor firstEvt: evtBuf 
	| keyValue |
	keyValue := evtBuf at: 6.
	keyValue < 256
		ifTrue: [^ (Character value: keyValue) squeakToIso].
	^ Character leadingChar: RussianEnvironment leadingChar code: keyValue