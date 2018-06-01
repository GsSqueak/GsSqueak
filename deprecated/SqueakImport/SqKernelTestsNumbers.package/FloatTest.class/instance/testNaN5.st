IEEE 754
testNaN5
	| nanstr |
	
	"check the NaN string representation conforms to IEEE 754"
	nanstr := Float nan asIEEE32BitWord printPaddedWith: $0 to: 32 base: 2.
	self
		assert: (#($0 $1) includes: (nanstr at: 1));
		assert: (nanstr copyFrom: 2 to: 9) = '11111111';
		assert: (#($0 $1) includes: (nanstr at: 10)); "accept both quiet and signalled NaNs"
		assert: ((nanstr copyFrom: 11 to: 32) reject: [ :c | #($0 $1) includes: c ]) isEmpty.
	
	"check a correct quiet NaN is created from a string"
	self assert: (Float fromIEEE32Bit:
		(Integer readFrom: '01111111110000000000000000000000' readStream base: 2)) isNaN