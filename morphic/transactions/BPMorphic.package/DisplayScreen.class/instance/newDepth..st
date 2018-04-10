other
newDepth: pixelSize 
	"
	Display newDepth: 8.
	Display newDepth: 1
	"
	| area need |
	(self supportsDisplayDepth: pixelSize)
		ifFalse: [^ self inform: 'Display depth ' , pixelSize printString , ' is not supported on this system'].
	pixelSize = self depth
		ifTrue: [^ self"no change"].
	pixelSize abs < self depth
		ifFalse: ["Make sure there is enough space"
			area := self boundingBox area.
			"pixels"
			need := area * (pixelSize abs - self depth) // 8 + Smalltalk lowSpaceThreshold.
			"new bytes needed"
			(Smalltalk garbageCollectMost <= need
					and: [Smalltalk garbageCollect <= need])
				ifTrue: [self error: 'Insufficient free space']].
	Display setExtent: Display extent depth: pixelSize.
	Display beDisplay.
	Project current
		ifNotNil: [:p | p displayDepthChanged; displaySizeChanged]