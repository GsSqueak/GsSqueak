as yet unclassified
fractionLeftInMove: thisMove

	| steps stepsRemaining fractionLeft endTime startTime |

	(thisMove includesKey: #steps) ifTrue: [
		steps := thisMove at: #steps ifAbsentPut: [1].
		stepsRemaining := thisMove at: #stepsRemaining ifAbsentPut: [steps].
		stepsRemaining < 1 ifTrue: [^nil].
		stepsRemaining := stepsRemaining - 1.
		fractionLeft := stepsRemaining / steps. 
		thisMove at: #stepsRemaining put: stepsRemaining.
	] ifFalse: [
		endTime := thisMove at: #endTime ifAbsent: [^nil].
		startTime := thisMove at: #startTime ifAbsent: [^nil].
		fractionLeft := (endTime - Time millisecondClockValue) / (endTime - startTime).
	].
	^fractionLeft max: 0
