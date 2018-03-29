message sending
lookupMNU
	"A send lookup failed. Replace the arguments on the stack with a
	Message and lookup
	#doesNotUndestand: starting at lkupClass. Note that MNU lookup
	ignores access modifiers.
	This makes it different from an ordinary send of
	#doesNotUnderstand:, which must only
	find public methods.
	IN: lkupClass
	IN: messageSelector
	IN: argumentCount
	OUT: newMethod
	OUT: primitiveIndex
	RESULT: LookupRuleMNU"
	| _gsSqueakTemp_currentClass _gsSqueakTemp_dictionary _gsSqueakTemp_found |
	self lookupBreakFor: lkupClass.
	self createActualMessageTo: lkupClass.
	messageSelector := objectMemory splObj: SelectorDoesNotUnderstand.
	_gsSqueakTemp_currentClass := lkupClass.
	[_gsSqueakTemp_currentClass ~= objectMemory nilObject]
		whileTrue: [_gsSqueakTemp_dictionary := objectMemory followObjField: MethodDictionaryIndex ofObject: _gsSqueakTemp_currentClass.
			_gsSqueakTemp_found := self lookupMethodInDictionary: _gsSqueakTemp_dictionary.
			_gsSqueakTemp_found
				ifTrue: [^ LookupRuleMNU].
			_gsSqueakTemp_currentClass := self superclassOf: _gsSqueakTemp_currentClass].
	self error: 'Recursive not understood error encountered'