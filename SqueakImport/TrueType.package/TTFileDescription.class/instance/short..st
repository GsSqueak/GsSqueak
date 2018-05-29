private
short: aNumber
	(aNumber bitAnd: 16r8000) = 0
		ifTrue: [^aNumber]
		ifFalse: [^-1 - (aNumber bitXor: 16rFFFF)]