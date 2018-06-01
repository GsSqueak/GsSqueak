menu
fillsOwnerString
	"Answer the string to be shown in a menu to represent the  
	'resistsRemoval' status"
	^ (self fillsOwner
		ifTrue: ['<on>']
		ifFalse: ['<off>'])
		, 'fills owner' translated
