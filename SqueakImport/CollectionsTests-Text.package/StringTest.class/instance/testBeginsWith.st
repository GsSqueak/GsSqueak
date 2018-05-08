tests - finding
testBeginsWith

	self assert: ('Elvis' beginsWith: 'Elv').
	self assert: ('Elvis' beginsWith: 'Elvis').
	self assert: ('Elvis' beginsWith: 'E').
	self deny: ('Elvis' beginsWith: 'e').
	self deny: ('Elvis' beginsWith: 'Elvis ').
	self deny: ('' beginsWith: '').
	self deny: ('abc' beginsWith: '')