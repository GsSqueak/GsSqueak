accessing
flapTab
	| ww |
	self isFlap
		ifFalse: [^ nil].
	ww := self world
				ifNil: [World].
	^ ww flapTabs
		detect: [:any | any referent == self]
		ifNone: []