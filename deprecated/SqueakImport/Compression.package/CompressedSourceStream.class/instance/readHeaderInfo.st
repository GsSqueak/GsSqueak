open/close
readHeaderInfo
	| valid a b |
	segmentFile position: 0.
	segmentSize := segmentFile nextNumber: 4.
	nSegments := segmentFile nextNumber: 4.
	endOfFile := segmentFile nextNumber: 4.
	segmentFile size < (nSegments+1 + 3 * 4) ifTrue: "Check for reasonable segment info"
		[self error: 'This file is not in valid compressed source format'].
	segmentTable := (1 to: nSegments+1) collect: [:x | segmentFile nextNumber: 4].
	segmentTable first ~= self firstSegmentLoc ifTrue:
		[self error: 'This file is not in valid compressed source format'].
	valid := true.
	1 to: nSegments do:  "Check that segment offsets are ascending"
		[:i | a := segmentTable at: i.  b := segmentTable at: i+1.
		(a = 0 and: [b ~= 0]) ifTrue: [valid := false].
		(a ~= 0 and: [b ~= 0]) ifTrue: [b <= a ifTrue: [valid := false]]].
	valid ifFalse:
		[self error: 'This file is not in valid compressed source format'].
	dirty := false.
	self position: 0.