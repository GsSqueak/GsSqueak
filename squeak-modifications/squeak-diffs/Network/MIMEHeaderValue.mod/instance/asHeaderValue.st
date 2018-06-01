printing
asHeaderValue
	| strm |
	strm := WriteStream on: (String new: 20).
	strm nextPutAll: mainValue.
	parameters associationsDo: [:e | 
		strm 
			nextPut: $; ; 
			nextPutAll: e key;
		 	nextPutAll: '=';
		 	nextPutAll: e value].
	^ strm contents