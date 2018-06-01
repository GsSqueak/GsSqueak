as yet unclassified
select: bestPrevious or: current asClosestTo: aMorph

	bestPrevious ifNil: [^current].
	(bestPrevious bounds intersects: aMorph bounds) ifTrue: [^bestPrevious].
	(current bounds intersects: aMorph bounds) ifTrue: [^current].
	bestPrevious left < current left ifTrue: [
		^aMorph left < current left ifTrue: [bestPrevious] ifFalse: [current]
	].
	^aMorph left < bestPrevious left ifTrue: [current] ifFalse: [bestPrevious]
