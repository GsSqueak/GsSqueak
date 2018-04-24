*SqClasses-*SqClasses-*SqClasses-sources, changes log
saveImageSegments

	| haveSegs oldImageSegDir |
	haveSegs := false.
	Smalltalk at: #NativeImageSegment ifPresent: [:theClass | 
		(haveSegs := theClass instanceCount ~= 0) ifTrue: [
			oldImageSegDir := theClass segmentDirectory]].
	haveSegs ifTrue: [
		Smalltalk at: #NativeImageSegment ifPresent: [:theClass | | newImageSegDir |
			newImageSegDir := theClass segmentDirectory.	"create the folder"
			oldImageSegDir fileNames do: [:theName | "copy all segment files"
				| imageSegmentName |
				imageSegmentName := oldImageSegDir pathName, FileDirectory slash, theName.
				newImageSegDir 
					copyFileWithoutOverwriteConfirmationNamed: imageSegmentName
					toFileNamed: theName]]].
