message sending
lookupProtected: selector startingAt: mixinApplication rule: rule 
	"A shared part of the lookup for self, outer or implicit receiver sends
	that did not find a
	private lexically visible method, and (Newspeak) super sends."
	| _gsSqueakTemp_currentClass _gsSqueakTemp_dictionary _gsSqueakTemp_found |
	self lookupBreakFor: mixinApplication.
	_gsSqueakTemp_currentClass := mixinApplication.
	[_gsSqueakTemp_currentClass = objectMemory nilObject]
		whileFalse: [_gsSqueakTemp_dictionary := objectMemory followObjField: MethodDictionaryIndex ofObject: _gsSqueakTemp_currentClass.
			_gsSqueakTemp_found := self lookupMethodInDictionary: _gsSqueakTemp_dictionary.
			(_gsSqueakTemp_found
					and: [(self isPrivateMethod: newMethod) not])
				ifTrue: [^ rule].
			_gsSqueakTemp_currentClass := self superclassOf: _gsSqueakTemp_currentClass].
	^ self lookupMNU