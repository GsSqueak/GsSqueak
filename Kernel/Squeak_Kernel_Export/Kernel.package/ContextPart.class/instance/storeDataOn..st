objects from disk
storeDataOn: aDataStream
	"Contexts are not always allowed go to out in DataStreams.  They must be included inside an ImageSegment,
	 or be being saved for a closure."
	| cntInstVars cntIndexedVars |

	(aDataStream insideASegment
	 or: [(Notification new tag: self; signal) == self]) ifFalse: "or perhaps ImageSegments were not used at all"
		[self error: 'This Context was not included in the ImageSegment'].

	cntInstVars := self class instSize.
	cntIndexedVars := self method frameSize.
	aDataStream
		beginInstance: self class
		size: cntInstVars + cntIndexedVars.
	 1 to: cntInstVars do:
		[:i | aDataStream nextPut: (self instVarAt: i)].
	1 to: stackp do:
		[:i | aDataStream nextPut: (self basicAt: i)].
	stackp + 1 to: cntIndexedVars do:
		[:i | aDataStream nextPut: nil]