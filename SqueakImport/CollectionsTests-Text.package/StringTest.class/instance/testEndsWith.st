tests - finding
testEndsWith

	self assert: ('Elvis' endsWith: 'vis').
	self assert: ('Elvis' endsWith: 'Elvis').
	self assert: ('Elvis' endsWith: 's').
	self deny: ('Elvis' endsWith: 'S').
	self deny: ('Elvis' endsWith: ' Elvis').
	self deny: ('' endsWith: '').
	self deny: ('abc' endsWith: '')