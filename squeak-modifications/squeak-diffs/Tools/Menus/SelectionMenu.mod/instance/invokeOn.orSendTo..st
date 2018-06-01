invocation
invokeOn: targetObject orSendTo: anObject
	"Pop up the receiver, obtaining a selector; return the result of having the target object perform the selector.  If it dos not understand the selector, give the alternate object a chance"

	| aSelector |
	^ (aSelector := self startUp) ifNotNil:
		[(targetObject respondsTo: aSelector)
			ifTrue:
				[targetObject perform: aSelector]
			ifFalse:
				[anObject perform: aSelector]]