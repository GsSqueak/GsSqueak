system category list
selectedSystemCategory
	"Answer the name of the selected system category or nil."

	self hasSystemCategorySelected
		ifFalse: [^nil].
	packageListIndex = 0
		ifTrue: [^ super selectedSystemCategory ].
	^ self package , '-' , super selectedSystemCategory