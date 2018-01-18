world state
triggerOpeningScripts	"If the receiver has any scripts set to run on opening, run them now"	self player		ifNotNil: [:aPlayer | aPlayer runAllOpeningScripts]