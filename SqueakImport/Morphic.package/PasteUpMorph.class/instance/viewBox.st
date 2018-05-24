project state
viewBox
	"This tortured workaround arises from a situation encountered 
	in which a PasteUpMorph was directliy lodged as a submorph 
	of another PasteUpMorph of identical size, with the former 
	bearing flaps but the latter being the world"
	^ worldState
		ifNil: [super viewBox]
		ifNotNil: [worldState viewBox]