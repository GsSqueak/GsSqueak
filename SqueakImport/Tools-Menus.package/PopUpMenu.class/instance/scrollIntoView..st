marker adjustment
scrollIntoView: cursorLoc
	| dy |
	dy := 0.
	cursorLoc y < 2 ifTrue: [dy := font height].
	cursorLoc y > (Display height-3) ifTrue: [dy := font height negated].
	dy = 0 ifTrue: [^ 0@0].
	self markerOff.
	frame := frame translateBy: 0@dy.
	marker := marker translateBy: 0@dy.
	self menuForm displayOn: Display at: frame topLeft.
	^ 0@dy