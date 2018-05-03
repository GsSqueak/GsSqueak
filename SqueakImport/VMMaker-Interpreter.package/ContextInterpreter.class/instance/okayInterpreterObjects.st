debug support
okayInterpreterObjects

	| oopOrZero oop |
	self okayFields: objectMemory getNilObj.
	self okayFields: objectMemory getFalseObj.
	self okayFields: objectMemory getTrueObj.
	self okayFields: objectMemory getSpecialObjectsOop.
	self okayFields: activeContext.
	self okayFields: method.
	self okayFields: receiver.
	self okayFields: theHomeContext.
	self okayFields: messageSelector.
	self okayFields: newMethod.
	self okayFields: lkupClass.
	0 to: MethodCacheEntries - 1 by: MethodCacheEntrySize do: [ :i |
		oopOrZero := methodCache at: i + MethodCacheSelector.
		oopOrZero = 0 ifFalse: [
			self okayFields: (methodCache at: i + MethodCacheSelector).
			self okayFields: (methodCache at: i + MethodCacheClass).
			self okayFields: (methodCache at: i + MethodCacheMethod).
		].
	].
	1 to: objectMemory getRemapBufferCount do: [ :i |
		oop := objectMemory remapBufferAt: i.
		(objectMemory isIntegerObject: oop) ifFalse: [
			self okayFields: oop.
		].
	].
	self okayActiveProcessStack.