html
closeHtmlOn: aStream 

	self evalString lines size > 1 ifTrue: [
		aStream 
			breakLines: true;
			nextPutAll: '</pre>'].
	aStream nextPutAll: '</code>'.
