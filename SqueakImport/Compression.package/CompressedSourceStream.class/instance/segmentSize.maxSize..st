private
segmentSize: segSize maxSize: maxSize
	"Note that this method can be called after the initial open, provided that no
	writing has yet taken place.  This is how to override the default segmentation."
	self size = 0 ifFalse: [self error: 'Cannot set parameters after the first write'].
	segmentFile position: 0.
	segmentFile nextNumber: 4 put: (segmentSize := segSize).
	segmentFile nextNumber: 4 put: (nSegments := maxSize // segSize + 2).
	segmentFile nextNumber: 4 put: (endOfFile := 0).
	segmentTable := Array new: nSegments+1 withAll: 0.
	segmentTable at: 1 put: self firstSegmentLoc.  "Loc of first segment, always."
	segmentTable do: [:i | segmentFile nextNumber: 4 put: i].
	segmentIndex := 1.
	collection := String new: segmentSize.
	writeLimit := segmentSize.
	readLimit := 0.
	position := 0.
	endOfFile := 0.
	self writeSegment.
