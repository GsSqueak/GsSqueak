loading state
quickLoadEngineFrom: oop requiredState: requiredState 
	| _gsSqueakTemp_failureCode |
	(_gsSqueakTemp_failureCode := self quickLoadEngineFrom: oop) = 0
		ifFalse: [^ _gsSqueakTemp_failureCode].
	self stateGet = requiredState
		ifTrue: [^ 0].
	self stopReasonPut: GErrorBadState.
	^ GEFWrongState