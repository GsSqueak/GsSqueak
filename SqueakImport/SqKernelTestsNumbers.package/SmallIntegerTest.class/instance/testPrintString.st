testing - printing
testPrintString

	self assert: 1 printString  = '1'.
	self assert: -1 printString  = '-1'.
	self assert: SmallInteger minVal printString  = (Smalltalk wordSize = 8 ifTrue: [ '-1152921504606846976'] ifFalse: ['-1073741824']).
	self assert: SmallInteger maxVal printString  = (Smalltalk wordSize = 8 ifTrue: [ '1152921504606846975'] ifFalse: ['1073741823']).
	self assert: 12345 printString  = '12345'.
	self assert: -54321 printString  = '-54321'