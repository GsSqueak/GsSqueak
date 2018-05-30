menu
autoGradientString
	"Answer the string to be shown in a menu to represent the  
	'resistsRemoval' status"
	^ (self autoGradient
		ifTrue: ['<on>']
		ifFalse: ['<off>'])
		, 'auto gradient' translated