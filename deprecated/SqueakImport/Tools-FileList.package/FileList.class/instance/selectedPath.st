directory tree
selectedPath
	| top here |
	top := FileDirectory root.
	here := directory.
	^(Array streamContents:[:s| | next |
		s nextPut: here.
		[next := here containingDirectory.
		top pathName = next pathName] whileFalse:[
			s nextPut: next.
			here := next.
		]]) reversed.