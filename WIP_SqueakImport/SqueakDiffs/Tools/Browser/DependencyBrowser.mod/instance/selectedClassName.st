class list
selectedClassName
	| idx |
	idx := classListIndex ifNil: [0].
	^ self classList ifNotNil: [ :l | l at: idx ifAbsent: [nil]]