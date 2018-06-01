as yet unclassified
contentsOfEntireFile
	"Fetch the data off the server and store it in me.  But not if I already have it."

	readLimit := readLimit max: position.
	localDataValid ifTrue: [^ super contentsOfEntireFile].
	collection size = 0 ifTrue: [self on: (String new: 2000)].
	remoteFile getFileNamed: remoteFile fileName into: self.	"sets localDataValid := true"
	^ super contentsOfEntireFile