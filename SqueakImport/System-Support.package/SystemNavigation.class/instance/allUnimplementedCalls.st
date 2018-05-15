query
allUnimplementedCalls
	"Answer a collection of each message that is sent by an expression in a method but is not implemented by any object in the system."

	| result implementedMessages |
	implementedMessages := self allImplementedMessages.
	result := OrderedCollection new.
	self allSelectorsAndMethodsDo: [ :behavior :selector :method |
		method messagesDo: [ :each |
			(implementedMessages includes: each) ifFalse: [
					result add: (String streamContents: [ :stream |
						stream
							nextPutAll: behavior name;
							space;
							nextPutAll: selector;
							space;
							nextPutAll: 'calls: ';
							nextPutAll: each ]) ] ] ].
	^result