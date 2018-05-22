file in/out
storeSegment
	"Store my project out on the disk as an ImageSegment.  Keep the outPointers in memory.  Name it <project name>.seg.  *** Caller must be holding (Project alInstances) to keep subprojects from going out. ***"

	| currentWorld is sizeHint |
	currentWorld := Project current world.
	(currentWorld == world) ifTrue: [^ false]. 
		"self inform: 'Can''t send the current world out'."
	world isInMemory ifFalse: [^ false].  "already done"
	world ifNil: [^ false].  world presenter ifNil: [^ false].

	ScrapBook default emptyScrapBook.
	currentWorld checkCurrentHandForObjectToPaste.
	world releaseSqueakPages.
	sizeHint := self projectParameters at: #segmentSize ifAbsent: [0].

	is := ImageSegment
			copyFromRootsLocalFileFor: {world presenter. world}	"world, and all Players"
			sizeHint: sizeHint.

	is state = #tooBig ifTrue: [^ false].
	is segment size < 2000 ifTrue: ["debugging" 
		Transcript show: self name, ' only ', is segment size printString, 
			'bytes in Segment.'; cr].
	self projectParameters at: #segmentSize put: is segment size.
	is extract; writeToFile: self name.
	^ true