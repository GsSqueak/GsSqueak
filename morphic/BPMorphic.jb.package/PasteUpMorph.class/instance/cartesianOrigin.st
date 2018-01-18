misc
cartesianOrigin	^ self originAtCenter		ifTrue: [self center]		ifFalse: [self bottomLeft]