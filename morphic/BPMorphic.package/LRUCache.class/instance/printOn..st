printing
printOn: aStream 
	"Append to the argument, aStream, a sequence of characters 
	that identifies the receiver."
	aStream nextPutAll: self class name;
		 nextPutAll: ' size:';
		 nextPutAll: size asString;
		 nextPutAll: ', calls:';
		 nextPutAll: calls asString;
		 nextPutAll: ', hits:';
		 nextPutAll: hits asString;
		 nextPutAll: ', ratio:';
		 nextPutAll: ((hits isNumber
				and: [calls isNumber
						and: [calls ~= 0]])
			ifTrue: [hits / calls]
			ifFalse: [0]) asFloat asString