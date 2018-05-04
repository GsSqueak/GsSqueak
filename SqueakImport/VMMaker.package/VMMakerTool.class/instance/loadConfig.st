configurations
loadConfig

	((Smalltalk hasClassNamed: #UIManager)
			ifTrue: [ "Newer images use UIManager"
				(Smalltalk at: #UIManager) default
						chooseFileMatching: #('config' )
						label: 'Select VMMaker configuration...']
			ifFalse: [ "UIManager not present, use original StandardFileMenu implementation "
				(((Smalltalk at: #StandardFileMenu)
						oldFileMenu: FileDirectory default
						withPattern: '*.config')
						startUpWithCaption: 'Select VMMaker configuration...')
					ifNotNilDo: [ :fileResult | fileResult directory fullNameFor: fileResult name]])
		ifNotNilDo: [ :file |
			[vmMaker := VMMaker forConfigurationFile: file.
			vmMaker logger: logger.
			vmMaker platformDirectory]
				on: Error
				do: [self inform: 'Possible problem with path settings or platform name?'].
			configFileName := file. "set default config file name to the most recently loaded file"
			self updateAllViews]