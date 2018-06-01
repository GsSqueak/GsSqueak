tests - instance creation
testIntegerReadFrom
	self assert: (Integer readFrom: '123' readStream base: 10) = 123.
	self assert: (Integer readFrom: '-123' readStream base: 10) = -123.
	self should: [Integer readFrom: 'abc' readStream base: 10] raise: Error.
	self should: [Integer readFrom: 'D12' readStream base: 10] raise: Error.
	self assert: (Integer readFrom: 'abc' readStream ifFail: [0]) = 0.
	self assert: (Integer readFrom: 'D12' readStream ifFail: [0]) = 0.
	self assert: (Integer readFrom: '1two3' readStream base: 10) = 1.
