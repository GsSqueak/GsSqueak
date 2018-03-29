control primitives
primitivePerformInSuperclass
	| _gsSqueakTemp_lookupClass _gsSqueakTemp_rcvr _gsSqueakTemp_currentClass |
	_gsSqueakTemp_rcvr := self stackValue: 3.
	_gsSqueakTemp_lookupClass := self stackTop.
	(argumentCount > 3
			and: ["e.g. object:perform:withArguments:inClass:"
				objectMemory isOopForwarded: _gsSqueakTemp_rcvr])
		ifTrue: [^ self primitiveFail].
	_gsSqueakTemp_currentClass := objectMemory fetchClassOf: _gsSqueakTemp_rcvr.
	[_gsSqueakTemp_currentClass ~= _gsSqueakTemp_lookupClass]
		whileTrue: [_gsSqueakTemp_currentClass := self superclassOf: _gsSqueakTemp_currentClass.
			_gsSqueakTemp_currentClass = objectMemory nilObject
				ifTrue: [^ self primitiveFailFor: PrimErrBadArgument]].
	self
		primitiveObject: _gsSqueakTemp_rcvr
		perform: (self stackValue: 2)
		withArguments: (self stackValue: 1)
		lookedUpIn: _gsSqueakTemp_lookupClass
	"a.k.a. self stackValue: 3"
	"a.k.a. self stackTop"