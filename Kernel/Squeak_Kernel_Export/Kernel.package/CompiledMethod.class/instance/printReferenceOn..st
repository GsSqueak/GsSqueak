printing
printReferenceOn: aStream 
	"Print a string that can be used to access the currently installed method."
	aStream print: self methodClass;
		 nextPutAll: '>>';
		 nextPutAll: self selector storeString