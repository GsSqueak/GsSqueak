package list
packageListIndex: aNumber
	"Current package list selection"
	packageListIndex := aNumber.
	self changed: #packageListIndex.
	self packageDepsIndex: 0.
	packageDeps := nil.
	self changed: #packageDeps.
