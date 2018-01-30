fileIn/Out
storeBitsOn: aStream base: anInteger 
	self unhibernate.
	bits
		do: [:word | 
			anInteger = 10
				ifTrue: [aStream space]
				ifFalse: [aStream crtab: 2].
			word storeOn: aStream base: anInteger]