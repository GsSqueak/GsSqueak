object access primitives
primitiveNextInstance
	| _gsSqueakTemp_object _gsSqueakTemp_subsequentObject |
	_gsSqueakTemp_object := self stackTop.
	(objectMemory isImmediate: _gsSqueakTemp_object)
		ifFalse: [_gsSqueakTemp_subsequentObject := objectMemory instanceAfter: _gsSqueakTemp_object.
			_gsSqueakTemp_subsequentObject
				ifNotNil: [^ self pop: argumentCount + 1 thenPush: _gsSqueakTemp_subsequentObject]].
	self primitiveFail