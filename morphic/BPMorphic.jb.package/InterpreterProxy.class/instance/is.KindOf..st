testing
is: oop KindOf: aString 
	"InterpreterProxy new is: 42 KindOf: 'Number'"
	| theClass |
	<var: #aString type: 'char *'>
	theClass := Smalltalk
				at: aString asSymbol
				ifAbsent: [].
	^ theClass isNil
		ifTrue: [false]
		ifFalse: [^ oop isKindOf: theClass]