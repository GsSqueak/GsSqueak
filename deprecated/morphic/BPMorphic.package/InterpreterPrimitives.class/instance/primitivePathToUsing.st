other primitives
primitivePathToUsing
	"primitivePathTo: anObject using: stack <Array> followWeak: boolean
	Answer a path to anObject from the root that does not pass through
	the current context"
	| _gsSqueakTemp_err _gsSqueakTemp_path |
	self externalWriteBackHeadFramePointers.
	argumentCount >= 2
		ifFalse: [^ self primitiveFailFor: PrimErrBadNumArgs].
	(self stackTop = objectMemory trueObject
			or: [self stackTop = objectMemory falseObject])
		ifFalse: [^ self primitiveFailFor: PrimErrBadArgument].
	_gsSqueakTemp_err := self
				pathTo: (self stackValue: 2)
				using: (self stackValue: 1)
				followWeak: self stackTop = objectMemory trueObject.
	_gsSqueakTemp_err ~= 0
		ifTrue: [^ self primitiveFailFor: _gsSqueakTemp_err].
	_gsSqueakTemp_path := self self stackValue: 1.
	self pop: argumentCount + 1 thenPush: _gsSqueakTemp_path