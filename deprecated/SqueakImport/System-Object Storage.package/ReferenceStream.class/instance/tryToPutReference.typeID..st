writing
tryToPutReference: anObject typeID: typeID
	"PRIVATE -- If we support references for type typeID, and if
	   anObject already appears in my output stream, then put a
	   reference to the place where anObject already appears. If we
	   support references for typeID but didn't already put anObject,
	   then associate the current stream position with anObject in
	   case one wants to nextPut: it again.
	 Return true after putting a reference; false if the object still
	   needs to be put.
	 : Added support for weak refs. Split out outputReference:.
	08:42 tk  references stores relative file positions."
	| referencePosn nextPosn |

	"Is it a reference type of object?"
	(self isAReferenceType: typeID) ifFalse: [^ false].

	"Have we heard of and maybe even written anObject before?"
	referencePosn := references at: anObject ifAbsent:
			["Nope. Remember it and let the sender write it."
			references at: anObject put: (byteStream position - basePos).	"relative"
			^ false].

	"If referencePosn is an Integer, it's the stream position of anObject."
	referencePosn isInteger ifTrue:
		[self outputReference: referencePosn.	"relative"
		^ true].

	referencePosn == #none ifTrue: ["for DiskProxy"
			references at: anObject put: (byteStream position - basePos).	"relative"
			^ false].


	"Else referencePosn is a collection of positions of weak-references to anObject.
	 Make them full references since we're about to really write anObject."
	references at: anObject put: (nextPosn := byteStream position) - basePos.	"store relative"
	referencePosn do: [:weakRefPosn |
			byteStream position: weakRefPosn + basePos.		"make absolute"
			self outputReference: nextPosn - basePos].	"make relative"
	byteStream position: nextPosn.		"absolute"
	^ false