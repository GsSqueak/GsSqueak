printing
printOn: aStream 
	"Overrides method inherited from the byte arrayed collection."
	aStream nextPut: $(.
	self printReferenceOn: aStream.
	aStream space; nextPut: $".
	self printNameOn: aStream.
	aStream nextPut: $(;
		 print: self identityHash;
		 nextPut: $);
		 nextPut: $";
		 nextPut: $)