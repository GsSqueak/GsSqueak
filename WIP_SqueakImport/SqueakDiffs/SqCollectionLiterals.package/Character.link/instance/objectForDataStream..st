object fileIn
objectForDataStream: refStrm
	"I am being collected for inclusion in a segment.  Do not include Characters!  Let them be in outPointers."

	refStrm insideASegment
		ifFalse: ["Normal use" ^ self]
		ifTrue: ["recording objects to go into an ImageSegment"			
			"remove it from references.  Do not trace."
			refStrm references removeKey: self ifAbsent: [].
			^ nil]
