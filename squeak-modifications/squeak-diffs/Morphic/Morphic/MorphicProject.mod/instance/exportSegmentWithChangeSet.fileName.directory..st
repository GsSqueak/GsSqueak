file in/out
exportSegmentWithChangeSet: aChangeSetOrNil fileName: aFileName
directory: aDirectory

	^ self exportSegmentWithChangeSet: aChangeSetOrNil fileName: aFileName directory: aDirectory withoutInteraction: false