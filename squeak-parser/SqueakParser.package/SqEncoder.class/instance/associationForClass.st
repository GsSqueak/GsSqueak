results
associationForClass
	| assoc |
	assoc := self environment
				associationAt: cue getClass name
				ifAbsent: [].
	^ assoc value == cue getClass
		ifTrue: [assoc]
		ifFalse: [Association new value: cue getClass]