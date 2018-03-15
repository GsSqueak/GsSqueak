printing
printOn: t1 
	t1 nextPut: $(.
	self printReferenceOn: t1.
	t1 space; nextPut: $".
	self printNameOn: t1.
	t1 nextPut: $(;
		 print: self identityHash;
		 nextPut: $);
		 nextPut: $";
		 nextPut: $)