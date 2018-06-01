Compile-time transformation of #future and #future: messages.  Use is best described through examples:

	receiver future doSomething: arg1 withArgs: arg2.
	(receiver future: 2000) doSomethingElse

The first means to immediately schedule #doSomething:withArgs: for asyncronous evaluation.  The second means to wait 2000 milliseconds before scheduling #doSomethingElse for asynchronous evaluation.

These are transformed into either #futureDo:at:args: or #futureSend:at:args:, depending on whether the result is used.  Let's look at a few examples.

	[receiver future foo. 2+2] value.
	true ifTrue: [^receiver future foo].
	arraySize := receiver future getArray wait size.
	
In the first case, the result is never used, so the message #futureDo:at:args: is generated.  In the second case, the result is answered from the current method.  Since we don't do any cross-method analysis, we have to assume that the result is needed for a later computation.  The result is provided in the form of a Promise, which will resolve to a value when the asynchronous evaluation has completed.  Creating and resolving this Promise is the responsibility of #futureSend:at:args:, which is generated instead of #futureDo:at:args: when code-analysis indicates that the result of the message might be used.  The third example is another one where #futureSend:at:args: is generated.

See the default implementations of #futureDo:at:args: and #futureSend:at:args: in Object.  Subclasses are free to override the default implementations to achieve specific effects.  For example, this functionality originated in the Croquet class TFarRef.  If you have a TFarRef to a replicated object, then sending 'aTFarRef future foo' results in a message being sent over the network to each replica of the object referenced by aTFarRef.  We might also use far-refs, for example, to send a message to an object in another Hydra object-memory.