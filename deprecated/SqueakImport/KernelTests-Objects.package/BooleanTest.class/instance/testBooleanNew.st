tests
testBooleanNew

	self should: [Boolean new] raise: TestResult error. 
	self should: [True new] raise: TestResult error. 
	self should: [False new] raise: TestResult error. 