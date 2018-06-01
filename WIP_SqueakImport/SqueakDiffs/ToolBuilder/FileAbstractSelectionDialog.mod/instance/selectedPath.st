path and pattern
selectedPath
	"Return an array of directories representing the path from directory up to the root; used to build the directory tree morph"

	| top here |
	top := FileDirectory root.
	here := self directory.
	^(Array streamContents:[:s| | next |
		s nextPut: here.
		[next := here containingDirectory.
		top pathName = next pathName] whileFalse:[
			s nextPut: next.
			here := next.
		]]) reversed.