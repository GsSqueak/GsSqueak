menu building
menuSelectionsArray: aDirectory
"Answer a menu selections object corresponding to aDirectory.  The object is an array corresponding to each item, each element itself constituting a two-element array, the first element of which contains a selector to operate on and the second element of which contains the parameters for that selector."

	|dirSize|
	dirSize := aDirectory pathParts size.
	^Array streamContents: [:s |
		canTypeFileName ifTrue:
			[s nextPut: (StandardFileMenuResult
				directory: aDirectory
				name: nil)].
		s nextPut: (StandardFileMenuResult
			directory: (FileDirectory root)
			name: '').
		aDirectory pathParts doWithIndex: 
			[:d :i | s nextPut: (StandardFileMenuResult
					directory: (self 
						advance: dirSize - i
						containingDirectoriesFrom: aDirectory)
					name: '')].
		aDirectory directoryNames do: 
			[:dn |  s nextPut: (StandardFileMenuResult
						directory: (FileDirectory on: (aDirectory fullNameFor: dn))
						name: '')].
		aDirectory fileNames do: 
			[:fn | pattern do: [:pat | (pat match: fn) ifTrue: [
					s nextPut: (StandardFileMenuResult
						directory: aDirectory
						name: fn)]]]]