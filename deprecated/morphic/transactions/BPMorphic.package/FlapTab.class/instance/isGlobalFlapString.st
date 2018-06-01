globalness
isGlobalFlapString
	"Answer a string to construct a menu item representing control 
	over whether the receiver is or is not a shared flap"
	^ (self isGlobalFlap
		ifTrue: ['<yes>']
		ifFalse: ['<no>'])
		, 'shared by all projects' translated