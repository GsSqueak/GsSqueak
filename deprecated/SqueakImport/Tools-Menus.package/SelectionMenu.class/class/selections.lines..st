instance creation
selections: selectionsArray lines: linesArray
	"Answer an instance of me whose labels and selections are identical."

	^ self
		labelList: (selectionsArray collect: [:each | each asString])
		lines: linesArray
		selections: selectionsArray