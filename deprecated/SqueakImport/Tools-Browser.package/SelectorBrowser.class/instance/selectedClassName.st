accessing
selectedClassName
	"Answer the name of the currently selected class."

	classListIndex = 0 ifTrue: [^nil].
	^ self selectedClass name