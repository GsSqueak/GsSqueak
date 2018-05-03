control primitives
primitivePerform
	<returnTypeC: #void>
	| performSelector newReceiver lookupClass performMethod |
	performSelector := messageSelector.
	performMethod := newMethod.
	messageSelector := self stackValue: argumentCount - 1.
	newReceiver := self stackValue: argumentCount.

	"NOTE: the following lookup may fail and be converted to #doesNotUnderstand:,
	 so we must adjust argumentCount and slide args now, so that will work."

	"Slide arguments down over selector"
	argumentCount := argumentCount - 1.
	argumentCount to: 1 by: -1 do:
		[:i|
		stackPages
			longAt: stackPointer + (i * objectMemory bytesPerWord)
			put: (stackPages longAt: stackPointer + ((i - 1) * objectMemory bytesPerWord))].
	self pop: 1.
	lookupClass := objectMemory fetchClassOf: newReceiver.
	self sendBreak: messageSelector + objectMemory baseHeaderSize
		point: (objectMemory lengthOf: messageSelector)
		receiver: newReceiver.
	self findNewMethodInClass: lookupClass.

	"Only test CompiledMethods for argument count - other objects will have to take their chances"
	((objectMemory isOopCompiledMethod: newMethod)
	  and: [(self argumentCountOf: newMethod) = argumentCount]) ifFalse:
		["Slide the args back up (sigh) and re-insert the selector."
		self unPop: 1.
		1 to: argumentCount by: 1 do:
			[:i |
			stackPages longAt: stackPointer + ((i - 1) * objectMemory bytesPerWord)
				put: (stackPages longAt: stackPointer + (i * objectMemory bytesPerWord))].
		stackPages longAt: stackPointer + (argumentCount * objectMemory bytesPerWord) put: messageSelector.
		argumentCount := argumentCount + 1.
		newMethod := performMethod.
		messageSelector := performSelector.
		^self primitiveFail].

	self executeNewMethod.
	"Recursive xeq affects primErrorCode"
	self initPrimCall