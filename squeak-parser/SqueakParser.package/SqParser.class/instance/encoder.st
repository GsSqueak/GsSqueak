public access
encoder
	^ encoder
		ifNil: [encoder := SqEncoderForV3PlusClosures new]