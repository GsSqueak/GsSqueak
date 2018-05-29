evaluating
once
	"Evaluate the receiver exactly once, so that repeated evaluations
	 answer exactly the same object as the first evaluation.  This
	 allows one to intern values with the idiom
		myResourceMethod
			^[expression] once"

	| cache |
	cache := self method
				propertyValueAt: #onceCache
				ifAbsent: [self method propertyValueAt: #onceCache put: Dictionary new].
	^cache at: startpc ifAbsentPut: [self value]

