tests - finding
testFindSubstringInStartingAtMatchTable

	| str tbl cm |
	str := 'hello '.
	tbl := String classPool at: #CaseSensitiveOrder.
	self assert: (str findSubstring: ' ' in: str startingAt: 1 matchTable: tbl) = 6.
	self assert: (str findSubstring: 'q' in: str startingAt: 1 matchTable: tbl) = 0.
	self assert: (str findSubstring: 'q' in: str startingAt: -1 matchTable: tbl) = 0.
	self assert: (str findSubstring: ' ' in: str startingAt: -1 matchTable: tbl) = 6.

	
	"The next test ensures that the fallback code works just as well"
	cm := (ByteString >> #findSubstring:in:startingAt:matchTable:) withoutPrimitive.
	self assert: (cm valueWithReceiver: str arguments: {' '. str. 1. tbl}) = 6.
	self assert: (cm valueWithReceiver: str arguments: {'q'. str. 1. tbl}) = 0.
	self assert: (cm valueWithReceiver: str arguments: {'q'. str. -1. tbl}) = 0.
	self assert: (cm valueWithReceiver: str arguments: {' '. str. -1. tbl}) = 6.
