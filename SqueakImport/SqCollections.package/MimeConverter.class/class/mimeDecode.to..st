convenience
mimeDecode: aStringOrStream to: outStream
	self new
		mimeStream: (aStringOrStream isStream
			ifTrue: [aStringOrStream]
			ifFalse: [ReadStream on: aStringOrStream]);
		dataStream: outStream;
		mimeDecode