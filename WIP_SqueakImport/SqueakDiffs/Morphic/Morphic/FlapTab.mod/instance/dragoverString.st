mouseover & dragover
dragoverString
	"Answer the string to be shown in a menu to represent the 
	dragover status"
	^ (popOutOnDragOver
		ifTrue: ['<yes>']
		ifFalse: ['<no>']), 'pop out on dragover' translated