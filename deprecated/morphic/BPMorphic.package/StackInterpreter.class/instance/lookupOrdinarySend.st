message sending
lookupOrdinarySend
	"Do the full lookup for an ordinary send (i.e., a Newspeak or Smalltalk
	ordinary send or a Smalltalk super send).
	IN: lkupClass
	IN: messageSelector
	IN: argumentCount
	OUT: newMethod
	OUT: primitiveIndex
	RESULT: LookupRuleOrdinary or LookupRuleMNU"
	| _gsSqueakTemp_currentClass _gsSqueakTemp_dictionary _gsSqueakTemp_found |
	self
		assert: (self addressCouldBeClassObj: lkupClass).
	self lookupBreakFor: lkupClass.
	_gsSqueakTemp_currentClass := lkupClass.
	[_gsSqueakTemp_currentClass ~= objectMemory nilObject]
		whileTrue: [_gsSqueakTemp_dictionary := objectMemory followObjField: MethodDictionaryIndex ofObject: _gsSqueakTemp_currentClass.
			_gsSqueakTemp_found := self lookupMethodInDictionary: _gsSqueakTemp_dictionary.
			_gsSqueakTemp_found
				ifTrue: [(self isPublicMethod: newMethod)
						ifTrue: [^ LookupRuleOrdinary].
					(self isProtectedMethod: newMethod)
						ifTrue: [^ self lookupMNU]].
			_gsSqueakTemp_currentClass := self superclassOf: _gsSqueakTemp_currentClass].
	^ self lookupMNU