menus
stickinessString
	"Answer the string to be shown in a menu to represent the  
	stickiness status"
	^ (self isSticky
		ifTrue: ['<yes>']
		ifFalse: ['<no>'])
		, 'resist being picked up' translated