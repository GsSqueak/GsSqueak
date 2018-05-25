*SqClasses-*SqClasses-*SqClasses-memory space
bytesLeftString
	"Answer a string describing the amount of memory available."
	"Smalltalk bytesLeftString"
	| largestFree availInternal availPhysical availTotal |
	largestFree := self garbageCollect.
	availInternal := self primBytesLeft.
	availPhysical := self bytesLeft: false.
	availTotal := self bytesLeft: true.
	(availTotal > (availInternal + 10000)) "compensate for mini allocations inbetween"
		ifFalse:[^availInternal asStringWithCommas, ' bytes available'].
	^String streamContents:
		[:s|
		{availInternal. availPhysical. largestFree. availTotal}
			with: #('old space' 'physical' 'largest free chunk' 'total')
			do: [:value :name|
				s nextPutAll: value asStringWithCommas; nextPutAll: ' bytes ('; nextPutAll: name; nextPutAll: ') '; cr]]
