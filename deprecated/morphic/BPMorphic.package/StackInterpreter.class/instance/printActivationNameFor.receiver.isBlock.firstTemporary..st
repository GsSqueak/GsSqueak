debug printing
printActivationNameFor: aMethod receiver: anObject isBlock: isBlock firstTemporary: maybeMessage 
	| _gsSqueakTemp_methClass _gsSqueakTemp_methodSel _gsSqueakTemp_classObj |
	isBlock
		ifTrue: [self print: '[] in '].
	_gsSqueakTemp_methClass := self findClassOfMethod: aMethod forReceiver: anObject.
	_gsSqueakTemp_methodSel := self findSelectorOfMethod: aMethod.
	((objectMemory addressCouldBeOop: anObject)
			and: [(objectMemory isOopForwarded: anObject) not
					and: [self addressCouldBeClassObj: (_gsSqueakTemp_classObj := objectMemory fetchClassOf: anObject)]])
		ifTrue: [(_gsSqueakTemp_classObj = _gsSqueakTemp_methClass
					or: [_gsSqueakTemp_methClass isNil
							or: [_gsSqueakTemp_methClass = objectMemory nilObject
								"i.e. doits"]])
				ifTrue: [self printNameOfClass: _gsSqueakTemp_classObj count: 5]
				ifFalse: [self printNameOfClass: _gsSqueakTemp_classObj count: 5.
					self print: '('.
					self printNameOfClass: _gsSqueakTemp_methClass count: 5.
					self print: ')']]
		ifFalse: [self
				cCode: ''
				inSmalltalk: [self halt].
			self print: 'INVALID RECEIVER'].
	self print: '>'.
	(objectMemory addressCouldBeOop: _gsSqueakTemp_methodSel)
		ifTrue: [_gsSqueakTemp_methodSel = objectMemory nilObject
				ifTrue: [self print: '(nil)']
				ifFalse: [self printStringOf: _gsSqueakTemp_methodSel]]
		ifFalse: [self print: 'INVALID SELECTOR'].
	(_gsSqueakTemp_methodSel
				= (objectMemory splObj: SelectorDoesNotUnderstand)
			and: [(objectMemory addressCouldBeObj: maybeMessage)
					and: [(objectMemory fetchClassOfNonImm: maybeMessage)
							= (objectMemory splObj: ClassMessage)]])
		ifTrue: ["print arg message selector"
			_gsSqueakTemp_methodSel := objectMemory fetchPointer: MessageSelectorIndex ofObject: maybeMessage.
			self print: ' '.
			self printStringOf: _gsSqueakTemp_methodSel]