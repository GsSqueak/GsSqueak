miscellaneous
nextClockwiseSideAfter: aSide
 	aSide == #left ifTrue:
		[^ #top].
	aSide == #right ifTrue:
		[^ #bottom].
	aSide == #top ifTrue:
		[^ #right].
	^ #left