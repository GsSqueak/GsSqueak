explain
explainDelimitor: string
	"Is string enclosed in delimitors?"

	| str |
	(string at: 1) isLetter ifTrue: [^nil].  "only special chars"
	(string first = string last) ifTrue:
			[^ self explainChar: (String with: string first)]
		ifFalse:
			[(string first = $( and: [string last = $)]) ifTrue:
				[^ self explainChar: (String with: string first)].
			(string first = $[ and: [string last = $]]) ifTrue:
				[^ self explainChar: (String with: string first)].
			(string first = ${ and: [string last = $}]) ifTrue:
				[^ self explainChar: (String with: string first)].
			(string first = $< and: [string last = $>]) ifTrue:
				[^ self explainChar: (String with: string first)].
			(string first = $# and: [string last = $)]) ifTrue:
				[^'"An instance of class Array.  The Numbers, Characters, Symbols or Arrays between the parenthesis are the elements of the Array."'].
			string first = $# ifTrue:
				[^'"An instance of class Symbol."'].
			(string first = $$ and: [string size = 2]) ifTrue:
				[^'"An instance of class Character.  This one is the character ', (String with: string last), '."'].
			(string first = $:) ifTrue:
				[string = ':=' ifTrue:
					[^'"Colon equals means assignment.  The value of the expression after the := is stored into the variable before it."'].
				str := string allButFirst.
				(self explainTemp: str) ifNotNil:
					[^'"An argument to this block will be bound to the temporary variable ', str, '."']]].
	^ nil