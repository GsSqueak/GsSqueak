package deps
packageDepsIndex: aNumber
	"Current package dependencies selection"
	packageDepsIndex := aNumber.
	self classDepsIndex: 0.
	self changed: #packageDepsIndex.
	self changed: #classDeps.
