open/close
test
	"FileDirectory default deleteFileNamed: 'test.stc'.
	(CompressedSourceStream on: (FileStream newFileNamed: 'test.stc')) fileOutChanges"

	"FileDirectory default deleteFileNamed: 'test2.stc'.
	((CompressedSourceStream on: (FileStream newFileNamed: 'test2.stc'))
		segmentSize: 100 nSegments: 1000) fileOutChanges"

	"FileDirectory default deleteFileNamed: 'test3.st'.
	(FileStream newFileNamed: 'test3.st') fileOutChanges"

	"(CompressedSourceStream on: (FileStream oldFileNamed: 'test.stc')) contentsOfEntireFile"
