configurations
saveConfig
	"write info about the current configuration to a file."

	((Smalltalk hasClassNamed: #UIManager)
		ifTrue: [ "Newer images use UIManager"
			((Smalltalk at: #UIManager) default
					request: 'Save VMMaker configuration...'
					initialAnswer: self configFileName)
				ifNotNilDo: [:f | | file path |
					('*.config' match: f)
						ifTrue: [file := f]
						ifFalse: [file := f , '.config'].
					"If path is not valid, the image has probably been moved to a new location or
					to a different platform. Assume this is the case, and change the path to the
					current default."
					path := file copyUpToLast: FileDirectory pathNameDelimiter.
					(FileDirectory default directoryExists: path)
						ifTrue: [file]
						ifFalse: [file copyReplaceAll: path with: FileDirectory default pathName]]]
		ifFalse: [ "UIManager not present, use original StandardFileMenu implementation"
			(((Smalltalk at: #StandardFileMenu)
						newFileMenu: FileDirectory default
						withPattern: '*.config')
						startUpWithCaption: 'Save VMMaker configuration...')
				ifNotNilDo: [ :fileResult |
					('*.config' match: fileResult name)
						ifFalse: [fileResult name: fileResult name , '.config'].
								fileResult directory fullNameFor: fileResult name]])
		ifNotNilDo: [ :file |
			vmMaker saveConfigurationTo: file.
			configFileName := file]