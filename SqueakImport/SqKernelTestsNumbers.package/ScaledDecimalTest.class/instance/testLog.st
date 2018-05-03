tests - mathematical functions
testLog
	self assert: ((10 raisedTo: 400) asScaledDecimal log closeTo: 400) description: 'log should be immune to intermediate Float overflow'.
	self assert: ((10 raisedTo: -400) asScaledDecimal log closeTo: -400) description: 'log should be immune to intermediate Float underflow'