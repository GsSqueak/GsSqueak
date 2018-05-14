as yet unclassified
nextCharFrom: sensor firstEvt: evtBuf 
	"Fall back on MacRoman if char is 0"
	^(evtBuf at: 6) > 0
		ifTrue: [(evtBuf at: 6) asCharacter]
		ifFalse: [(evtBuf at: 3) asCharacter macToSqueak].
