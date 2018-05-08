printing
printOn: aStream
	super printOn: aStream.
	aStream
		nextPut: $(;
		print: delayDuration;
		nextPutAll: ' msecs'.
	beingWaitedOn ifTrue:
		[aStream
			nextPutAll: '; ';
			print: resumptionTime - Time utcMicrosecondClock + 500 // 1000;
			nextPutAll: ' msecs remaining'].
	aStream nextPut: $)