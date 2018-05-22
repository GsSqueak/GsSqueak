accessing - loaded values
loadedCommentStamp
	
	^ self properties at: self keyForCommentStamp ifAbsent: [nil]