file directory
entries
	"Return a collection of directory entries for the files and 
	directories in this directory."
	| lines |
	lines := self getLines.
	^ lines isNil
		ifTrue: [#()] ifFalse:[
	
	self parseLines: lines]