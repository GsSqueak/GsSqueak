accessing
yesNoStringFor: aBool
	"Answer the string to be shown in a menu to represent the  
	yes/no status"
	^ (aBool
		ifTrue: ['<yes>']
		ifFalse: ['<no>'])
		