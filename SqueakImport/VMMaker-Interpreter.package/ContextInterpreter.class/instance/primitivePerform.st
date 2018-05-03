control primitives
primitivePerform
	| performSelector newReceiver selectorIndex lookupClass performMethod |
	performSelector := messageSelector.
	performMethod := newMethod.
	messageSelector := self stackValue: argumentCount - 1.
	newReceiver := self stackValue: argumentCount.

	"NOTE: the following lookup may fail and be converted to #doesNotUnderstand:, so we must adjust argumentCount and slide args now, so that would work."

	"Slide arguments down over selector"
	argumentCount := argumentCount - 1.
	selectorIndex := self stackPointerIndex - argumentCount.
	self
		transfer: argumentCount
		fromIndex: selectorIndex + 1
		ofObject: activeContext
		toIndex: selectorIndex
		ofObject: activeContext.
	self pop: 1.
	lookupClass := objectMemory fetchClassOf: newReceiver.
	self findNewMethodInClass: lookupClass.

	"Only test CompiledMethods for argument count - other objects will have to take their chances"
	(objectMemory isOopCompiledMethod: newMethod)
		ifTrue: [self success: (self argumentCountOf: newMethod) = argumentCount].

	self successful
		ifTrue: [self executeNewMethodFromCache.
			"Recursive xeq affects primFailCode"
			self initPrimCall]
		ifFalse: ["Slide the args back up (sigh) and re-insert the 
			selector. "
			1 to: argumentCount do: [:i | objectMemory
						storePointer: argumentCount - i + 1 + selectorIndex
						ofObject: activeContext
						withValue: (objectMemory fetchPointer: argumentCount - i + selectorIndex ofObject: activeContext)].
			self unPop: 1.
			objectMemory storePointer: selectorIndex
				ofObject: activeContext
				withValue: messageSelector.
			argumentCount := argumentCount + 1.
			newMethod := performMethod.
			messageSelector := performSelector]