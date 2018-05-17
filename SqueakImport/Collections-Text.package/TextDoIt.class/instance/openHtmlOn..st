html
openHtmlOn: aStream 

	aStream nextPutAll: '<code>'.
	self evalString lines size > 1 ifTrue: [
		aStream 
			breakLines: false;
			cr; 
			nextPutAll: '<pre>'].