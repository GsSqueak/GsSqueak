standard dialog operations
getFile
	| result |

	self flag: #unused.
	result := self getFilePathName.
	^result ifNotNil: [FileStream oldFileNamed: result]