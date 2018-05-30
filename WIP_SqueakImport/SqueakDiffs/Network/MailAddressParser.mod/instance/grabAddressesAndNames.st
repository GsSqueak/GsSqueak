parsing
grabAddressesAndNames
	
	storeNames := true.
	
	self grabAddresses.
	
	addresses := addresses collect: [:a |
		a isString 
			ifTrue: [{'' . a}]
			ifFalse: [a] ].

	^ addresses