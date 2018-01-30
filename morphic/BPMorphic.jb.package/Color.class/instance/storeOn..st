printing
storeOn: aStream 
	aStream nextPutAll: '(' , self species name;
		 nextPutAll: ' r: ';
		 print: self red maxDecimalPlaces: 3;
		 nextPutAll: ' g: ';
		 print: self green maxDecimalPlaces: 3;
		 nextPutAll: ' b: ';
		 print: self blue maxDecimalPlaces: 3;
		 nextPutAll: ')'