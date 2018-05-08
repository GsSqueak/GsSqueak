testing
testTextKern
	| att |

	att := TextKern kern: 5.
	self testScanAttribute: att encodedWithCharacter: $+ decodedWithBlock: [:strm |
		strm skip: -1.	"The first $+ was consumed by the encoding letter test"
		5 timesRepeat: [self assert: $+ equals: strm next].
		att].
	
	att := TextKern kern: -5.
	self testScanAttribute: att encodedWithCharacter: $- decodedWithBlock: [:strm |
		strm skip: -1.
		5 timesRepeat: [self assert: $- equals: strm next].
		att].