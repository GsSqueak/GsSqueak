debug support
asserta: aBooleanExpression 
	| _gsSqueakTemp_result |
	<doNotGenerate>
	(_gsSqueakTemp_result := aBooleanExpression value)
		ifFalse: [AssertionFailure signal: 'Assertion failed'].
	^ _gsSqueakTemp_result