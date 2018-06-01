writing
setStream: aStream reading: isReading
	"PRIVATE -- Initialization method."

	super setStream: aStream reading: isReading.
	"isReading ifFalse: [  when we are sure"
	references := IdentityDictionary new: 4096 * 5.
	isReading ifTrue: [
		objects := IdentityDictionary new: 4096 * 5.
		skipping := IdentitySet new.
		insideASegment := false.
		fwdRefEnds := IdentityDictionary new].
	blockers ifNil: [blockers := IdentityDictionary new].	"keep blockers we just passed in"
