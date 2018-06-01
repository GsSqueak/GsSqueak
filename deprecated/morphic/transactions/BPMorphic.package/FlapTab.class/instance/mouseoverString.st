mouseover & dragover
mouseoverString
	"Answer the string to be shown in a menu to represent the 
	mouseover status"
	^ (popOutOnMouseOver
		ifTrue: ['<yes>']
		ifFalse: ['<no>'])
		, 'pop out on mouseover' translated