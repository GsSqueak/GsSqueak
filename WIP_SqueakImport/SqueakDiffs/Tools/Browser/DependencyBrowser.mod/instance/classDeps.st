class deps
classDeps
	"Class dependencies for the currently selected package"
	packageDeps ifNil: [^ #()].
	^ (packageDeps at: self packageDepsSelection ifAbsent:[#()]) sort.
