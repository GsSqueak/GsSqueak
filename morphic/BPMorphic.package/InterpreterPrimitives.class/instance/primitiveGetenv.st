other primitives
primitiveGetenv
	"Access to environment variables via getenv. No putenv or setenv as
	yet. "
	| _gsSqueakTemp_var _gsSqueakTemp_result |
	sHEAFn ~= 0
		ifTrue: ["secHasEnvironmentAccess"
			self sHEAFn
				ifFalse: [^ self primitiveFailFor: PrimErrInappropriate]].
	_gsSqueakTemp_var := self cStringOrNullFor: self stackTop.
	_gsSqueakTemp_var = 0
		ifTrue: [self successful
				ifTrue: [^ self primitiveFailFor: PrimErrBadArgument].
			^ self primitiveFailFor: primFailCode].
	_gsSqueakTemp_result := self
				getenv: (self
						cCode: [_gsSqueakTemp_var]
						inSmalltalk: [_gsSqueakTemp_var allButLast]).
	self free: _gsSqueakTemp_var.
	_gsSqueakTemp_result ~= 0
		ifTrue: [_gsSqueakTemp_result := objectMemory stringForCString: _gsSqueakTemp_result.
			_gsSqueakTemp_result
				ifNil: [^ self primitiveFailFor: PrimErrNoMemory]].
	self assert: primFailCode = 0.
	self
		pop: 2
		thenPush: (_gsSqueakTemp_result = 0
				ifTrue: [objectMemory nilObject]
				ifFalse: [_gsSqueakTemp_result])