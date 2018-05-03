tests
testNext
	"Generate some float values, and see if they are in the [0,1) interval. Also check that the smallest and the largest values are small/large enough."

	| random min max |
	min := Float infinity.
	max := Float negativeInfinity.
	random := Random seed: 112629.
	100000 timesRepeat: [
		| next | 
		next := random next.
		next < min ifTrue: [ min := next ].
		next > max ifTrue: [ max := next ].
		self assert: next >= 0.0 description: [ 'Generated value ', next asString, ' should be non-negative.' ].
		self assert: next < 1.0 description: [ 'Generated value ', next asString, ' should be less than 1.0.' ] ].
	self assert: max > 0.9999 description: 'The largest generated value should be greater than 0.9999.'.
	self assert: min < 0.0001 description: 'The smallest generated value should be less than 0.0001.'