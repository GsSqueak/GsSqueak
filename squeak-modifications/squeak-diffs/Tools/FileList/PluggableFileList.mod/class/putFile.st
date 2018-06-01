standard dialog operations
putFile

	| result |
	result := self getFilePathNameWithExistenceCheck.
	^result ifNotNil: 
		[FileDirectory deleteFilePath: result.
		 FileStream newFileNamed: result]