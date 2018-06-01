debug support
okayInterpreterObjects
	| _gsSqueakTemp_oopOrZero _gsSqueakTemp_oop |
	self okayFields: objectMemory nilObject.
	self okayFields: objectMemory falseObject.
	self okayFields: objectMemory trueObject.
	self okayFields: objectMemory specialObjectsOop.
	self okayFields: messageSelector.
	self okayFields: newMethod.
	self okayFields: lkupClass.
	0
		to: MethodCacheEntries - 1
		by: MethodCacheEntrySize
		do: [:i | 
			_gsSqueakTemp_oopOrZero := methodCache at: i + MethodCacheSelector.
			_gsSqueakTemp_oopOrZero = 0
				ifFalse: [self
						okayFields: (methodCache at: i + MethodCacheSelector).
					self
						okayFields: (methodCache at: i + MethodCacheClass).
					self
						okayFields: (methodCache at: i + MethodCacheMethod)]].
	1
		to: objectMemory remapBufferCount
		do: [:i | 
			_gsSqueakTemp_oop := objectMemory remapBuffer at: i.
			(objectMemory isImmediate: _gsSqueakTemp_oop)
				ifFalse: [self okayFields: _gsSqueakTemp_oop]].
	self okayStackZone