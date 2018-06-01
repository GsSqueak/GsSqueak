convenience
mimeEncode: aCollectionOrStream to: outStream
	self new
		dataStream: (aCollectionOrStream isStream
			ifTrue: [aCollectionOrStream]
			ifFalse: [ReadStream on: aCollectionOrStream]);
		mimeStream: outStream;
		mimeEncode