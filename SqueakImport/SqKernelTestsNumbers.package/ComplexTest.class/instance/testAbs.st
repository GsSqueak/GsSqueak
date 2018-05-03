tests
testAbs
	"self run: #testAbs"
	"self debug: #testAbs"
	
	| c |
	c := (6 - 6 i).
	self assert: c abs  = 72 sqrt.
	