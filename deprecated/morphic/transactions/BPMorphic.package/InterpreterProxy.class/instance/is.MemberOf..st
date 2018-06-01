testing
is: oop MemberOf: aString 
	"InterpreterProxy new is: 42 MemberOf:'SmallInteger'"
	| theClass |
	<var: #aString type: 'char *'>
	theClass := Smalltalk
				at: aString asSymbol
				ifAbsent: [].
	^ theClass isNil
		ifTrue: [false]
		ifFalse: [^ oop isMemberOf: theClass]