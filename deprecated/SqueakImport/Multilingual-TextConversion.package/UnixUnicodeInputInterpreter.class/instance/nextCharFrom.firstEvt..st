keyboard
nextCharFrom: sensor firstEvt: evtBuf 
	| keyValue mark |
	keyValue := evtBuf at: self keyValueIndex.
	mark := self japaneseSpecialMark: keyValue.
	mark notNil
		ifTrue: [^ mark].
	keyValue < 256
		ifTrue: [^ Character value: keyValue].
	"Smalltalk systemLanguage charsetClass charFromUnicode: keyValue."
	^ Unicode value: keyValue