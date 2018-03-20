accessing comment
comment

	^ (self interface classCommentFor: self) ifNil: ['']