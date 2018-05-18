world state
triggerOpeningScripts
	"If the receiver has any scripts set to run on opening, run them now"
	| aPlayer |
	self allMorphsDo:[ :m|
	(aPlayer := m player) ifNotNil:
		[aPlayer runAllOpeningScripts]]