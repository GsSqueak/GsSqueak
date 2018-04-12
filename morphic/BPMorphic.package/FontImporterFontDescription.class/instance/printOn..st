printing
printOn: aStream 
	self parent
		ifNotNil: [:p | aStream nextPutAll: p fontname;
				 nextPut: $ ].
	aStream nextPutAll: self fontname.
	self children notEmpty
		ifTrue: [aStream nextPut: $ ].
	self children
		do: [:subfont | aStream nextPutAll: subfont fontname]
		separatedBy: [aStream nextPut: $/].
	aStream nextPut: $ ;
		 nextPut: $(.
	self allFilenames
		do: [:filename | aStream nextPutAll: filename]
		separatedBy: [aStream nextPut: $,;
				 nextPut: $ ].
	aStream nextPut: $)