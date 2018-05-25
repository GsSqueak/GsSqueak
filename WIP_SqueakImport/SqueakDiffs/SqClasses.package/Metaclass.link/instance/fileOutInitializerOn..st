fileIn/Out
fileOutInitializerOn: aStream
	(self methodDict includesKey: #initialize) ifTrue: 
		[aStream cr.
		aStream nextChunkPut: destClass name , ' initialize'].
