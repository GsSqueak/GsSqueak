message sending
lookupOrdinaryNoMNUEtcInClass: class 
	"Lookup messageSelector in class. Answer 0 on success. Answer the
	splObj: index
	for the error selector to use on failure rather than performing MNU
	processing etc."
	| _gsSqueakTemp_currentClass _gsSqueakTemp_dictionary _gsSqueakTemp_found |
	self lookupBreakFor: class.
	_gsSqueakTemp_currentClass := class.
	[_gsSqueakTemp_currentClass ~= objectMemory nilObject]
		whileTrue: [_gsSqueakTemp_dictionary := objectMemory followObjField: MethodDictionaryIndex ofObject: _gsSqueakTemp_currentClass.
			_gsSqueakTemp_dictionary = objectMemory nilObject
				ifTrue: [lkupClass := self superclassOf: _gsSqueakTemp_currentClass.
					^ SelectorCannotInterpret].
			_gsSqueakTemp_found := self lookupMethodInDictionary: _gsSqueakTemp_dictionary.
			NewspeakVM
				ifTrue: [_gsSqueakTemp_found
						ifTrue: [(self isPublicMethod: newMethod)
								ifTrue: [self addNewMethodToCache: class.
									^ 0].
							(self isProtectedMethod: newMethod)
								ifTrue: [lkupClass := class.
									^ SelectorDoesNotUnderstand]]]
				ifFalse: [_gsSqueakTemp_found
						ifTrue: [self addNewMethodToCache: class.
							^ 0]].
			_gsSqueakTemp_currentClass := self superclassOf: _gsSqueakTemp_currentClass].
	lkupClass := class.
	^ SelectorDoesNotUnderstand