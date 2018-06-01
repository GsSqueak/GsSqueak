package deps
packageDepsSelection
	"Current package dependencies selection"
	^(self packageDepsIndex between: 1 and: self packageDeps size)
		ifTrue:[self packageDeps at: self packageDepsIndex]