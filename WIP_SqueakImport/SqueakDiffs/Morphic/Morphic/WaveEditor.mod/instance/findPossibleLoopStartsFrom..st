other
findPossibleLoopStartsFrom: index 
	"Assume loopEnd is one sample before a zero-crossing."

	| r postLoopCycleStart i postLoopCycleLength cycleLength cycleCount err oldI |
	r := OrderedCollection new.

	"Record the start and length of the first cycle after the loop endpoint."
	postLoopCycleStart := loopEnd + 1.	"Assumed to be a zero-crossing."
	i := self zeroCrossingAfter: postLoopCycleStart 
						+ (0.9 * samplingRate / perceivedFrequency) asInteger.
	postLoopCycleLength := i - loopEnd - 1.

	"Step backwards one cycle at a time, using zero-crossings to find the
	 beginning of each cycle, and record the auto-corrolation error between
	 each cycle and the cycle following the loop endpoint. Assume pitch may shift gradually."
	i := self zeroCrossingAfter: postLoopCycleStart 
						- (1.1 * postLoopCycleLength) asInteger.
	cycleLength := postLoopCycleStart - i.
	cycleCount := 1.
	[cycleLength > 0] whileTrue: 
			[err := self 
						autoCorrolationBetween: i
						and: postLoopCycleStart
						length: postLoopCycleLength.
			r add: (Array 
						with: i
						with: err
						with: cycleCount
						with: ((loopEnd - i) asFloat / self samplingRate roundTo: 0.01)).
			oldI := i.
			i := self zeroCrossingAfter: oldI - (1.1 * cycleLength) asInteger.
			cycleLength := oldI - i.	"will be zero when start of data is encountered"
			cycleCount := cycleCount + 1].
	^r asArray sort: [:e1 :e2 | e1 second < e2 second]