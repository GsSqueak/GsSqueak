query
allUnimplementedNonPrimitiveCalls
	"Answer an collection of each message that is sent by an expression in a method but is not implemented by any object in the system. This list won't include primitive methods."

	| result implementedMessages |
	implementedMessages := self allImplementedMessages.
	result := OrderedCollection new.
	self allSelectorsAndMethodsDo: [ :behavior :selector :method |
		method primitive = 0 ifTrue: [
			method messagesDo: [ :each |
				(implementedMessages includes: each) ifFalse: [
					result add: (String streamContents: [ :stream |
						stream
							nextPutAll: behavior name;
							space;
							nextPutAll: selector;
							space;
							nextPutAll: 'calls: ';
							nextPutAll: each ]) ] ] ] ].
	^result