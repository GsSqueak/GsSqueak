world state
triggerClosingScripts
	"If the receiver has any scripts set to run on closing, run them now"
	self player
		ifNotNil: [:aPlayer | aPlayer runAllClosingScripts]