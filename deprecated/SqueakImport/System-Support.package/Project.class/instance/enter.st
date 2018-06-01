enter
enter
	"Enter the new project"
	
	self enter: (CurrentProject ifNil: [false] ifNotNil: [CurrentProject parent == self]) revert: false saveForRevert: false.
