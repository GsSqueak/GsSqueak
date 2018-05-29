applying
computeSustainValueAtMSecs: mSecs
	"Return the value of this envelope at the given number of milliseconds from its onset. Return zero for times outside the time range of this envelope."
	"Note: Unlike the private method incrementalComputeValueAtMSecs:, this method does is not increment. Thus it is slower, but it doesn't depend on being called sequentially at fixed time intervals.
	Note: this is the same as computeValueAtMSecs: apart from removing the first  section that requires loopEndMSecs t obe nil; this appears to cause a problem when a sound in playing and is stopped whilst the #computeSlopeAtMSecs: method is run inside the SoundPlayer loop"

	| t i |
	mSecs < 0 ifTrue: [^ 0.0].

	mSecs < loopStartMSecs ifTrue: [  "attack phase"
		i := self indexOfPointAfterMSecs: mSecs startingAt: 1.
		i = 1 ifTrue: [^ (points at: 1) y * scale].
		^ self interpolate: mSecs between: (points at: i - 1) and: (points at: i)].

	"sustain phase"
	loopMSecs = 0 ifTrue: [^ (points at: loopEndIndex) y * scale].  "looping on a single point"
	t := loopStartMSecs + ((mSecs - loopStartMSecs) \\ loopMSecs).
	i := self indexOfPointAfterMSecs: t startingAt: loopStartIndex.

	^ self interpolate: t between: (points at: i - 1) and: (points at: i)
