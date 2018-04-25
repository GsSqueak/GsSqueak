accessing
upToEnd
	"Answer the remaining elements in the stream."
	
	| elements |
	elements := OrderedCollection new.
	[self atEnd] whileFalse: [ 
		elements add: self next].
	^ elements