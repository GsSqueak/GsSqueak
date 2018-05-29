modules
listBuiltinModules
	"Smalltalk listBuiltinModules"
	"Return a list of all builtin modules (e.g., plugins). Builtin plugins are those that are 	compiled with the VM directly, as opposed to plugins residing in an external shared library. 	The list will include all builtin plugins regardless of whether they are currently loaded 
	or not. Note that the list returned is not sorted!"

	| modules index name |
	modules := WriteStream on: (Array new: 20).
	index := 1.
	[
		name := self listBuiltinModule: index.
		name ifNil:[^modules contents].
		modules nextPut: name.
		index := index + 1 ] repeat
