fixups
replaceSendsIn: array1 with: array2
	"Replace all the sends that occur in array1 with those in array2. Used for fixing old event handlers in files."
	| old index |
	1 to: self class instSize do:[:i|
		old := self instVarAt: i.
		index := array1 identityIndexOf: old.
		index > 0 ifTrue:[self instVarAt: i put: (array2 at: index)]].