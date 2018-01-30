controlling
send: selector to: rcvr with: args startClass: startClassOrNil 
	"Simulate the action of sending a message with selector, selector, and
	 arguments, args, to receiver. The argument, startClassOrNil, tells whether
	 the selector should be looked up in startClassOrNil or the class of the receiver."

	| class meth val ctxt |
	class := startClassOrNil ifNil: [self objectClass: rcvr].
	meth := class lookupSelector: selector.
	meth == nil ifTrue:
		[^self
			send: #doesNotUnderstand:
			to: rcvr
			with: (Array with: (Message selector: selector arguments: args))
			startClass: class].
	(args isArray
	 and: [args size = meth numArgs]) ifFalse:
		[^ContextPart primitiveFailTokenFor: nil].
	val := self tryPrimitiveFor: meth receiver: rcvr args: args.
	((self objectClass: val) == Array
	 and: [val size = 2
	 and: [val first == PrimitiveFailToken]]) ifFalse:
		[^val].
	(selector == #doesNotUnderstand:
	 and: [class == ProtoObject]) ifTrue:
		[^self error: 'Simulated message ' , (args at: 1) selector, ' not understood'].
	ctxt := self activateMethod: meth withArgs: args receiver: rcvr class: class.
	((self objectClass: val) == Array
	 and: [val size = 2
	 and: [val first == PrimitiveFailToken
	 and: [val last notNil
	 and: [(ctxt method at: ctxt pc) = 129 "long store temp"]]]]) ifTrue:
		[ctxt at: ctxt stackPtr put: val last].
	^ctxt