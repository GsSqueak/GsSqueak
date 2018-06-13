oop access
smallIntegerFromOop: anOop ifFail: failBlock

	^ anOop <= self oopMaxSmallInteger
			ifTrue: [anOop >> 3]
			ifFalse: [anOop >> 3 - (self oopMaxSmallInteger >> 2 + 2)]