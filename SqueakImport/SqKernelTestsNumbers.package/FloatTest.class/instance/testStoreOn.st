testing
testStoreOn
	"If storeOn: prints exactly and the parser avoid cumulating round off Errors,
	then Float should be read back exactly.
	Note: there is no guarantee to restore the bit pattern of NaN though"
	
	self assert: (Compiler evaluate: Float halfPi storeString) = Float halfPi.
	self assert: (Compiler evaluate: Float halfPi negated storeString) = Float halfPi negated.
	self assert: (Compiler evaluate: Float infinity storeString) = Float infinity.
	self assert: (Compiler evaluate: Float negativeInfinity storeString) = Float negativeInfinity.
	self assert: (Compiler evaluate: Float nan storeString) isNaN.