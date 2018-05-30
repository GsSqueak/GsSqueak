directory tree
rootDirectoryList
	"Return a list of know root directories; forms the root nodes ot the directory tree morph"

	| dirList dir |
	dir := FileDirectory root.
	dirList := self subDirectoriesOf: dir.
	dirList isEmpty ifTrue:[dirList := Array with: FileDirectory default].
	^dirList ,(ServerDirectory servers values) "looks odd because #servers returns the Dictionary of known servers with local names instead of the actaul server directories"