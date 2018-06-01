message sending
lookupMethodInClass: class 
	| _gsSqueakTemp_currentClass _gsSqueakTemp_dictionary _gsSqueakTemp_found |
	self
		assert: (self addressCouldBeClassObj: class).
	self lookupBreakFor: class.
	_gsSqueakTemp_currentClass := class.
	[_gsSqueakTemp_currentClass ~= objectMemory nilObject]
		whileTrue: [_gsSqueakTemp_dictionary := objectMemory followObjField: MethodDictionaryIndex ofObject: _gsSqueakTemp_currentClass.
			_gsSqueakTemp_dictionary = objectMemory nilObject
				ifTrue: ["MethodDict pointer is nil (hopefully due a swapped
					out stub)
					-- raise exception #cannotInterpret:."
					self createActualMessageTo: class.
					messageSelector := objectMemory splObj: SelectorCannotInterpret.
					self sendBreakpoint: messageSelector receiver: nil.
					^ self
						lookupMethodInClass: (self superclassOf: _gsSqueakTemp_currentClass)].
			_gsSqueakTemp_found := self lookupMethodInDictionary: _gsSqueakTemp_dictionary.
			_gsSqueakTemp_found
				ifTrue: [^ _gsSqueakTemp_currentClass].
			_gsSqueakTemp_currentClass := self superclassOf: _gsSqueakTemp_currentClass].
	"Could not find #doesNotUnderstand: -- unrecoverable error."
	messageSelector
			= (objectMemory splObj: SelectorDoesNotUnderstand)
		ifTrue: [self error: 'Recursive not understood error encountered'].
	"Cound not find a normal message -- raise exception
	#doesNotUnderstand: "
	self createActualMessageTo: class.
	messageSelector := objectMemory splObj: SelectorDoesNotUnderstand.
	self
		sendBreak: messageSelector + objectMemory baseHeaderSize
		point: (objectMemory lengthOf: messageSelector)
		receiver: nil.
	^ self lookupMethodInClass: class