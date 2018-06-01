as yet unclassified
nextCharFrom: sensor firstEvt: evtBuf 
	| keyValue mark |
	keyValue := evtBuf at: 6.
	mark := self japaneseSpecialMark: keyValue.
	mark notNil
		ifTrue: [^ mark].
	keyValue < 256
		ifTrue: [^ (Character value: keyValue) squeakToIso].
	^ Character leadingChar: JapaneseEnvironment leadingChar code: keyValue