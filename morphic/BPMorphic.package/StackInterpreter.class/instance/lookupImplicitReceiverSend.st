message sending
lookupImplicitReceiverSend
	"Do the full lookup for an implicit receiver send.
	IN: messageSelector
	IN: argumentCount
	OUT: localAbsentReceiver
	OUT: localAbsentReceiverOrZero
	OUT: newMethod
	OUT: primitiveIndex
	RESULT: LookupRuleImplicit or LookupRuleMNU"
	| _gsSqueakTemp_methodReceiver _gsSqueakTemp_candidateReceiver _gsSqueakTemp_candidateMixin _gsSqueakTemp_candidateMixinApplication _gsSqueakTemp_dictionary _gsSqueakTemp_found |
	messageSelector := objectMemory followMaybeForwarded: messageSelector.
	_gsSqueakTemp_methodReceiver := self receiver.
	_gsSqueakTemp_candidateReceiver := _gsSqueakTemp_methodReceiver.
	self
		deny: (objectMemory isForwarded: method).
	_gsSqueakTemp_candidateMixin := self methodClassOf: method.
	localAbsentReceiverOrZero := 0.
	[self
		deny: (objectMemory isForwarded: _gsSqueakTemp_candidateMixin).
	self
		deny: (objectMemory isForwarded: _gsSqueakTemp_candidateReceiver).
	_gsSqueakTemp_candidateMixinApplication := self
				findApplicationOfTargetMixin: _gsSqueakTemp_candidateMixin
				startingAtBehavior: (objectMemory fetchClassOf: _gsSqueakTemp_candidateReceiver).
	self deny: _gsSqueakTemp_candidateMixinApplication = 0.
	self deny: _gsSqueakTemp_candidateMixinApplication = objectMemory nilObject.
	self
		deny: (objectMemory isForwarded: _gsSqueakTemp_candidateMixinApplication).
	self
		assert: (self addressCouldBeClassObj: _gsSqueakTemp_candidateMixinApplication).
	_gsSqueakTemp_dictionary := objectMemory followObjField: MethodDictionaryIndex ofObject: _gsSqueakTemp_candidateMixinApplication.
	_gsSqueakTemp_found := self lookupMethodInDictionary: _gsSqueakTemp_dictionary.
	_gsSqueakTemp_found
		ifTrue: [localAbsentReceiver := _gsSqueakTemp_candidateReceiver.
			^ self
				lookupLexical: messageSelector
				from: _gsSqueakTemp_candidateMixin
				rule: LookupRuleImplicit].
	_gsSqueakTemp_candidateMixin := objectMemory followObjField: EnclosingMixinIndex ofObject: _gsSqueakTemp_candidateMixin.
	self
		deny: (objectMemory isForwarded: _gsSqueakTemp_candidateMixin).
	_gsSqueakTemp_candidateMixin = objectMemory nilObject]
		whileFalse: [localAbsentReceiverOrZero := _gsSqueakTemp_candidateReceiver := objectMemory followObjField: EnclosingObjectIndex ofObject: _gsSqueakTemp_candidateMixinApplication].
	"There is no lexically visible method, so the implicit receiver is the
	method receiver."
	localAbsentReceiverOrZero := 0.
	localAbsentReceiver := _gsSqueakTemp_methodReceiver.
	lkupClass := objectMemory fetchClassOf: _gsSqueakTemp_methodReceiver.
	"MNU lookup starts here."
	^ self
		lookupProtected: messageSelector
		startingAt: lkupClass
		rule: LookupRuleImplicit