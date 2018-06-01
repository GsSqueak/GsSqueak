rounding
roundedCorners
	edgeToAdhereTo == #bottom ifTrue: [^ #(1 4)].
	edgeToAdhereTo == #right ifTrue: [^ #(1 2)].
	edgeToAdhereTo == #left ifTrue: [^ #(3 4)].
	^ #(2 3)  "#top and undefined"
