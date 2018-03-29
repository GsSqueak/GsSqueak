message sending
lookupLexical: selector from: mixin rule: rule 
	"A shared part of the lookup for implicit receiver sends that found a
	lexically visible
	method, and self and outer sends."
	| _gsSqueakTemp_receiverClass _gsSqueakTemp_mixinApplication _gsSqueakTemp_dictionary _gsSqueakTemp_found |
	_gsSqueakTemp_receiverClass := objectMemory fetchClassOf: localAbsentReceiver.
	self lookupBreakFor: _gsSqueakTemp_receiverClass.
	lkupClass := _gsSqueakTemp_receiverClass.
	"MNU lookup starts here."
	_gsSqueakTemp_mixinApplication := self findApplicationOfTargetMixin: mixin startingAtBehavior: _gsSqueakTemp_receiverClass.
	_gsSqueakTemp_dictionary := objectMemory followObjField: MethodDictionaryIndex ofObject: _gsSqueakTemp_mixinApplication.
	_gsSqueakTemp_found := self lookupMethodInDictionary: _gsSqueakTemp_dictionary.
	(_gsSqueakTemp_found
			and: [self isPrivateMethod: newMethod])
		ifTrue: [^ rule].
	^ self
		lookupProtected: selector
		startingAt: _gsSqueakTemp_receiverClass
		rule: rule