private
short: aNumber 
	(aNumber bitAnd: 32768)
			= 0
		ifTrue: [^ aNumber]
		ifFalse: [^ -1
				- (aNumber bitXor: 65535)]