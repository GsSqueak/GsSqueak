printing
printSignatureOn: t1 
	t1 print: self methodClass;
		 nextPutAll: '>>';
		 nextPutAll: self selector storeString