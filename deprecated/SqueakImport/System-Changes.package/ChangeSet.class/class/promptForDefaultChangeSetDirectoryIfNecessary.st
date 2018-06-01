defaults
promptForDefaultChangeSetDirectoryIfNecessary
	"Check the Preference (if any), and prompt the user to change it if necessary.
	The default if the Preference is unset is the current directory.
	Answer the directory."

	"ChangeSet promptForDefaultChangeSetDirectoryIfNecessary"
	| choice directoryName dir |
	directoryName := Preferences
				parameterAt: #defaultChangeSetDirectoryName
				ifAbsentPut: [''].
	[dir := FileDirectory default directoryNamed: directoryName.
	dir exists]
		whileFalse: [choice := UIManager default chooseFrom: {
			'Create directory' translated.
			'Use default directory and forget preference' translated.
			'Choose another directory'  translated
		} title: ('The preferred change set directory (''{1}'') does not exist.
Create it or use the default directory ({2})?' translated format: { directoryName. FileDirectory default pathName }).
			choice = 1
				ifTrue: [dir assureExistence ].
			choice = 3
				ifTrue: [dir := UIManager default chooseDirectory.
					directoryName := dir
					ifNil: [ '' ]
						ifNotNil: [dir pathName ]]].
		self defaultChangeSetDirectory: directoryName.
		^dir