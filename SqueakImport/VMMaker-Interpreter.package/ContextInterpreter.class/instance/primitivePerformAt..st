control primitives
primitivePerformAt: lookupClass
	"Common routine used by perform:withArgs: and perform:withArgs:inSuperclass:"

	"NOTE:  The case of doesNotUnderstand: is not a failure to perform.
	The only failures are arg types and consistency of argumentCount."

	| performSelector argumentArray arraySize index cntxSize performMethod performArgCount |
	argumentArray := self stackTop.
	(objectMemory isArray: argumentArray) ifFalse:[^self primitiveFail].

	self successful ifTrue:
		["Check for enough space in thisContext to push all args"
		arraySize := objectMemory fetchWordLengthOf: argumentArray.
		cntxSize := objectMemory fetchWordLengthOf: activeContext.
		self success: (self stackPointerIndex + arraySize) < cntxSize].
	self successful ifFalse: [^nil].

	performSelector := messageSelector.
	performMethod := newMethod.
	performArgCount := argumentCount.
	"pop the arg array and the selector, then push the args out of the array, as if they were on the stack"
	self popStack.
	messageSelector := self popStack.

	"Copy the arguments to the stack, and execute"
	index := 1.
	[index <= arraySize]
		whileTrue:
		[self push: (objectMemory fetchPointer: index - 1 ofObject: argumentArray).
		index := index + 1].
	argumentCount := arraySize.

	self findNewMethodInClass: lookupClass.

	"Only test CompiledMethods for argument count - any other objects playacting as CMs will have to take their chances"
	(objectMemory isOopCompiledMethod: newMethod)
		ifTrue: [self success: (self argumentCountOf: newMethod) = argumentCount].

	self successful
		ifTrue: [self executeNewMethodFromCache.  "Recursive xeq affects primFailCode"
				self initPrimCall]
		ifFalse: ["Restore the state by popping all those array entries and pushing back the selector and array, and fail"
				self pop: argumentCount.
				self push: messageSelector.
				self push: argumentArray.
				messageSelector := performSelector.
				newMethod := performMethod.
				argumentCount := performArgCount]
