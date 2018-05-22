instance creation
labels: labels selections: selectionsArray
	"Answer an instance of me whose items are in labels, recording 
	the given array of selections corresponding to the items in labels."

	^ self
		labels: labels
		lines: #()
		selections: selectionsArray