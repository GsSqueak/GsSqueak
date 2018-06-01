package list
packageListSelection
	"Current package list selection"
	^(self packageListIndex between: 1 and: self packageList size)
		ifTrue:[self packageList at: self packageListIndex]