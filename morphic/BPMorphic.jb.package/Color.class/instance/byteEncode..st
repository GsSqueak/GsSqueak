printing
byteEncode: aStream 
	aStream print: '(';
		 print: self species name;
		 print: ' r: ';
		
		write: (self red roundTo: 0.001);
		 print: ' g: ';
		
		write: (self green roundTo: 0.001);
		 print: ' b: ';
		
		write: (self blue roundTo: 0.001);
		 print: ')'