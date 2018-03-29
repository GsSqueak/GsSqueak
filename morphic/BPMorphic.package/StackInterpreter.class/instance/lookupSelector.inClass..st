debug support
lookupSelector: selector inClass: class 
	"Lookup selector in class. Answer the method or nil. This is a
	debugging routine.
	It does /not/ side-effect lookupClass or newMethod."
	| _gsSqueakTemp_currentClass _gsSqueakTemp_dictionary |
	_gsSqueakTemp_currentClass := class.
	[_gsSqueakTemp_currentClass ~= objectMemory nilObject]
		whileTrue: [_gsSqueakTemp_dictionary := objectMemory followObjField: MethodDictionaryIndex ofObject: _gsSqueakTemp_currentClass.
			_gsSqueakTemp_dictionary = objectMemory nilObject
				ifTrue: [^ nil].
			(self lookupMethodFor: selector InDictionary: _gsSqueakTemp_dictionary)
				ifNotNil: [:meth | ^ meth].
			_gsSqueakTemp_currentClass := self superclassOf: _gsSqueakTemp_currentClass].
	^ nil