send bytecodes
directedSuperclassSend
	"Send a message to self, starting lookup with the superclass of the
	class on top of stack."
	"Assume: messageSelector and argumentCount have been set, and
	that the receiver and arguments have been pushed onto the stack,"
	"Note: This method is inlined into the interpreter dispatch loop."
	| _gsSqueakTemp_class _gsSqueakTemp_superclass |
	_gsSqueakTemp_class := self internalPopStack.
	(objectMemory isForwarded: _gsSqueakTemp_class)
		ifTrue: [_gsSqueakTemp_class := objectMemory followForwarded: _gsSqueakTemp_class].
	_gsSqueakTemp_superclass := self superclassOf: _gsSqueakTemp_class.
	"classTagForClass: uses ensureBehaviorHash:"
	lkupClassTag := objectMemory classTagForClass: _gsSqueakTemp_superclass.
	"To maintain the invariant that all receivers are unforwarded we need
	an explicit
	read barrier in the super send cases. Even though we always follow
	receivers on become e.g. super doSomethingWith: (self become:
	other) forwards the receiver
	self pushed on the stack."
	self ensureReceiverUnforwarded.
	self assert: lkupClassTag ~= objectMemory nilObject.
	self commonSendOrdinary