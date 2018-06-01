writing
setStream: aStream
	"PRIVATE -- Initialization method."

	super setStream: aStream.
	references := IdentityDictionary new: 4096 * 5.
	objects := IdentityDictionary new: 4096 * 5.
	fwdRefEnds := IdentityDictionary new.
	skipping := IdentitySet new.
	insideASegment := false.
	blockers ifNil: [blockers := IdentityDictionary new].	"keep blockers we just passed in"
