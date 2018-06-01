examples
hotColdShades: thisMany
	"An array of thisMany colors showing temperature from blue to red to white hot.  (Later improve this by swinging in hue.)  "
	"Color showColors: (Color hotColdShades: 25)"

	| n s1 s2 s3 s4 s5 |
	thisMany < 5 ifTrue: [^ self error: 'must be at least 5 shades'].
	n := thisMany // 5.
	s1 := self white mix: self yellow shades: (thisMany - (n*4)).
	s2 := self yellow mix: self red shades: n+1.
	s2 := s2 copyFrom: 2 to: n+1.
	s3 := self red mix: self green darker shades: n+1.
	s3 := s3 copyFrom: 2 to: n+1.
	s4 := self green darker mix: self blue shades: n+1.
	s4 := s4 copyFrom: 2 to: n+1.
	s5 := self blue mix: self black shades: n+1.
	s5 := s5 copyFrom: 2 to: n+1.
	^ s1, s2, s3, s4, s5
