world state
triggerClosingScripts
	"If the receiver has any scripts set to run on closing, run them now"
	| aPlayer |
	self allMorphsDo:[ :m|
	(aPlayer := m player) ifNotNil:
		[aPlayer runAllClosingScripts]]