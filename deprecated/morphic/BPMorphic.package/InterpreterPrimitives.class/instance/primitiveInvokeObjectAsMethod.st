control primitives
primitiveInvokeObjectAsMethod
	"Primitive. 'Invoke' an object like a function, sending the special
	message 
	run: originalSelector with: arguments in: aReceiver.
	"
	| _gsSqueakTemp_runReceiver _gsSqueakTemp_runArgs _gsSqueakTemp_lookupClassTag |
	_gsSqueakTemp_runArgs := objectMemory hasSpurMemoryManagerAPI
				ifTrue: [objectMemory
						eeInstantiateClassIndex: ClassArrayCompactIndex
						format: objectMemory arrayFormat
						numSlots: argumentCount]
				ifFalse: [objectMemory
						eeInstantiateClass: (objectMemory splObj: ClassArray)
						indexableSize: argumentCount].
	argumentCount - 1
		to: 0
		by: -1
		do: [:i | objectMemory
				storePointerUnchecked: i
				ofObject: _gsSqueakTemp_runArgs
				withValue: self popStack].
	_gsSqueakTemp_runReceiver := self popStack.
	"setup send of newMethod run: originalSelector with: runArgs in:
	runReceiver "
	self push: newMethod.
	"newReceiver"
	self push: messageSelector.
	"original selector"
	self push: _gsSqueakTemp_runArgs.
	self push: _gsSqueakTemp_runReceiver.
	"stack is clean here"
	messageSelector := objectMemory splObj: SelectorRunWithIn.
	argumentCount := 3.
	_gsSqueakTemp_lookupClassTag := objectMemory fetchClassTagOf: newMethod.
	self findNewMethodInClassTag: _gsSqueakTemp_lookupClassTag.
	self executeNewMethod.
	"Recursive xeq affects successFlag"
	self initPrimCall