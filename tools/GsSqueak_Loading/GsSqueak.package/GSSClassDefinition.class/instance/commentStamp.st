accessing
commentStamp
	
	^ self loadedCommentStamp ifNil: [self defaultCommentStamp]