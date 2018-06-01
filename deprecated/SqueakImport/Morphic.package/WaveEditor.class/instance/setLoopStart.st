menu
setLoopStart
	"Assuming that the loop end and approximate frequency have been set, this method uses the current cursor position to determine the loop length and the number of cycles."

	| start len |
	start := graph cursor.
	((start >= loopEnd) or: [perceivedFrequency = 0]) ifTrue: [
		^ self inform:
'Please set the loop end and the approximate frequency
first, then position the cursor one or more cycles
before the loop end and try this again.' translated].
	len := (loopEnd - start) + 1.
	loopCycles := (len / (samplingRate / perceivedFrequency)) rounded.
	self loopLength: len.

