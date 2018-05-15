modules
listLoadedModules
	"Smalltalk listLoadedModules"
	"Return a list of all currently loaded modules (e.g., plugins). Loaded modules are those that currently in use (e.g., active). The list returned will contain all currently active modules regardless of whether they're builtin (that is compiled with the VM) or external (e.g., residing in some external shared library). Note that the returned list is not sorted!"
	| modules index name |
	modules := WriteStream on: (Array new: 20).
	index := 1.
	[
		name := self listLoadedModule: index.
		name ifNil:[^modules contents].
		modules nextPut: name.
		index := index + 1 ] repeat