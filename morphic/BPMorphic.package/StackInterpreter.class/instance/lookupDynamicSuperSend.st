message sending
lookupDynamicSuperSend
	"Do the full lookup for a Newspeak super send.
	IN: messageSelector
	IN: argumentCount
	OUT: localAbsentReceiver
	OUT: newMethod
	OUT: primitiveIndex
	RESULT: LookupRuleDynamicSuper or LookupRuleMNU"
	| _gsSqueakTemp_methodMixin _gsSqueakTemp_methodMixinApplication |
	localAbsentReceiver := self receiver.
	localAbsentReceiverOrZero := 0.
	_gsSqueakTemp_methodMixin := self methodClassOf: method.
	_gsSqueakTemp_methodMixinApplication := self
				findApplicationOfTargetMixin: _gsSqueakTemp_methodMixin
				startingAtBehavior: (objectMemory fetchClassOf: localAbsentReceiver).
	lkupClass := self superclassOf: _gsSqueakTemp_methodMixinApplication.
	"MNU lookup starts here."
	^ self
		lookupProtected: messageSelector
		startingAt: lkupClass
		rule: LookupRuleDynamicSuper