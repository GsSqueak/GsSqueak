message sending
lookupOuterSend: depth 
	"Do the full lookup for a self or outer send.
	IN: messageSelector
	IN: argumentCount
	OUT: localAbsentReceiver
	OUT: localAbsentReceiverOrZero
	OUT: newMethod
	OUT: primitiveIndex
	RESULT: [depth] or LookupRuleMNU"
	| _gsSqueakTemp_targetMixin _gsSqueakTemp_count _gsSqueakTemp_mixinApplication |
	localAbsentReceiver := self receiver.
	localAbsentReceiverOrZero := 0.
	_gsSqueakTemp_targetMixin := self methodClassOf: method.
	_gsSqueakTemp_count := 0.
	[_gsSqueakTemp_count < depth]
		whileTrue: [_gsSqueakTemp_count := _gsSqueakTemp_count + 1.
			_gsSqueakTemp_mixinApplication := self
						findApplicationOfTargetMixin: _gsSqueakTemp_targetMixin
						startingAtBehavior: (objectMemory fetchClassOf: localAbsentReceiver).
			localAbsentReceiverOrZero := localAbsentReceiver := objectMemory followObjField: EnclosingObjectIndex ofObject: _gsSqueakTemp_mixinApplication.
			_gsSqueakTemp_targetMixin := objectMemory followObjField: EnclosingMixinIndex ofObject: _gsSqueakTemp_targetMixin].
	^ self
		lookupLexical: messageSelector
		from: _gsSqueakTemp_targetMixin
		rule: depth