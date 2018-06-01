accessing
setNotification: aSyntaxErrorNotification

	| types printables badChar code |
	notification := aSyntaxErrorNotification.
	class := aSyntaxErrorNotification errorClass.
	debugger := Debugger context: aSyntaxErrorNotification signalerContext.
	code := aSyntaxErrorNotification errorCode.
	selector := class newParser parseSelector: code.
	types := Scanner classPool at: #TypeTable.	"dictionary"
	printables := '!@#$%&*-_=+<>{}?/\,·£¢§¶ªºÚæÚ¯×¿«»`~`' asSet.
	badChar := code detect: [:aChar | (types at: aChar asciiValue ifAbsent: [#xLetter]) == #xBinary and: [
			(printables includes: aChar) not]] ifNone: [nil].
	contents := badChar 
		ifNil: [code]
		ifNotNil: ['<<<This string contains a character (ascii value ', 
			badChar asciiValue printString,
			') that is not normally used in code>>> ', code].