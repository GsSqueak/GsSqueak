query
unimplemented
	"Answer an collection of each message that is sent by an expression in a method but is not implemented by any object in the system."

	| implemented unimplemented |
	implemented := self allImplementedMessages.
	unimplemented := IdentityDictionary new.
	self allSelectorsAndMethodsDo: [ :behavior :selector :method |
		method messagesDo: [ :each |
			| entry |
			(implemented includes: each) ifFalse: [
				entry := unimplemented 
					at: each 
					ifPresent: [ :oldEntry |
						oldEntry copyWith: behavior name, '>', selector ]
					ifAbsent: [ 
						{ behavior name, '>', selector } ].
				unimplemented at: each put: entry ] ] ].
	^unimplemented