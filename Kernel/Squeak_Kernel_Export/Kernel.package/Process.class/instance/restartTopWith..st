changing suspended state
restartTopWith: method
	"Rollback top context and replace with new method.  Assumes self is suspended"

	method isQuick 
		ifTrue: [self popTo: suspendedContext sender]
		ifFalse:
			[suspendedContext method frameSize >= method frameSize
				ifTrue: [suspendedContext privRefreshWith: method]
				ifFalse:
					[self assert: suspendedContext isExecutingBlock not.
					 suspendedContext := MethodContext
												sender: suspendedContext sender
												receiver: suspendedContext receiver
												method: method
												arguments: ((1 to: method numArgs) collect:
																[:i| suspendedContext tempAt: i])]].
