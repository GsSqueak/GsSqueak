query
allPrimitiveMethods
	"Answer a collection of all the methods that are implemented by primitives."

	| result |
	result := OrderedCollection new.
	self allSelectorsAndMethodsDo: [ :behavior :selector :method |
		method primitive ~= 0 ifTrue: [
			result add: (String streamContents: [ :stream |
				stream
					nextPutAll: behavior name;
					space;
					nextPutAll: selector;
					space;
					print: method primitive ]) ] ].
	^result