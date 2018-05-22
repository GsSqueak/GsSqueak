icons
importImageDirectory: directoryOrName 
	| dir extensions forms |
	dir := directoryOrName isString
		ifFalse: [ directoryOrName ]
		ifTrue: [ FileDirectory default directoryNamed: directoryOrName ].
	dir exists
		ifFalse: [self error: dir fullName , ' does not exist'. ^ #()].
	extensions := (ImageReadWriter allTypicalFileExtensions add: 'form';
				 yourself)
				collect: [:ex | '.' , ex].
	forms := OrderedCollection new.
	dir fileNames
		do: [:fileName | | fullName | (fileName endsWithAnyOf: extensions)
				ifTrue: [fullName := dir fullNameFor: fileName.
					(self importImageFromFileNamed: fullName)
						ifNotNil: [:form | forms add: form]]].
	^ forms