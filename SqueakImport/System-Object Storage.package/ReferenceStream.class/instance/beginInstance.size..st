writing
beginInstance: aClass size: anInteger
	"This is for use by storeDataOn: methods.  Cf. Object>>storeDataOn:."
	"Addition of 1 seems to make extra work, since readInstance has to compensate.  Here for historical reasons dating back to Kent Beck's original implementation in late 1988.
	In ReferenceStream, class is just 5 bytes for shared symbol.
	SmartRefStream puts out the names and number of class's instances variables for checking.
6/10/97 16:09 tk: See if we can put on a short header. Type = 16. "

	| short ref |
	short := true.	"All tests for object header that can be written in 4 bytes"
	anInteger <= 254 ifFalse: [short := false].	"one byte size"
	ref := references at: aClass name ifAbsent: [short := false. nil].
	ref isInteger ifFalse: [short := false].
	short ifTrue: [short := (ref < 65536) & (ref > 0) "& (ref ~= self vacantRef)"].  "vacantRef is big"
	short ifTrue: [short := byteStream peekLast = 9].	"ugly workaround"
	short 
		ifTrue: ["passed all the tests!"
			byteStream skip: -1; nextPut: 16; "type = short header"
				nextPut: anInteger + 1;	"size is short"
				nextNumber: 2 put: ref]
		ifFalse: [
			"default to normal longer object header"
			byteStream nextNumber: 4 put: anInteger + 1.
			self nextPut: aClass name].
	insideASegment ifTrue: [
		aClass isSystemDefined ifFalse: [self nextPut: aClass]].
			"just record it to put it into roots"