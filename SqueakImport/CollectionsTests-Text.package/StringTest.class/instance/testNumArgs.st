testing
testNumArgs

	| binary punctuation |
	binary := '+-*/<=>&|,?\~@'.
	1 to: 3 do: [:length | binary combinations: length atATimeDo: [:each | self assert: each numArgs = 1]].
	
	self assert: 'foo' numArgs = 0.
	self assert: 'bar:' numArgs = 1.
	self assert: 'foo:bar:' numArgs = 2.
	self assert: 'foo2:bar1:' numArgs = 2.
	
	self assert: '::' numArgs = -1 description: 'empty keywords are forbidden'.
	
	punctuation := '.;()[]{}"`''#$'.
	punctuation , Character separators do: [:letter | self assert: ('foo' copyWith: letter) numArgs = -1 description: 'Smalltalk punctuation and separators are illegal in a selector'].
	
	self assert: 'nextPut:andCR' numArgs = -1 description: 'terminal colon is missing'.
	self assert: 'a0:1:' numArgs = -1 description: 'a keyword cannot begin with a digit'.
	self assert: '123' numArgs = -1.
	self assert: '' numArgs = -1.