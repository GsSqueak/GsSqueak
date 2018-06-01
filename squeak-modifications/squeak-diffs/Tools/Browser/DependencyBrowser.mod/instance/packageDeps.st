package deps
packageDeps
	"Package dependencies for the currently selected package"
	packageDeps ifNil:[
		packageDeps := Dictionary new.
		Cursor wait showWhile:[
			self computePackageDependencies: self packageListSelection.
		].
	].
	^packageDeps keys sort