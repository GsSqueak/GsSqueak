private
methodReferenceFrom: aString
	"Try to create a MethodReference from a line returned by MessageTally. Return nil if the string doesn't have the given format."

	| stream className selector |
	stream := aString readStream.
	"Skip percentages and timing data."
	stream
		skipTo: $};
		skipSeparators.
	(stream peekFor: $[) ifTrue: [ "Skip block markers."
		stream upToAnyOf: CharacterSet separators ].
	className := stream upToAnyOf: '(>'.
	stream atEnd ifTrue: [ ^nil ].
	stream last == $( ifTrue: [ "Method is defined in a super class"
		className := stream upTo: $).
		(stream peekFor: $>) ifFalse: [ ^nil ] ].
	(stream peekFor: $>) ifFalse: [ ^nil ].
	selector := stream upToEnd.
	^MethodReference
		class: ((Smalltalk classNamed: className) ifNil: [ ^nil ])
		selector: ((Symbol lookup: selector) ifNil: [ ^nil ])