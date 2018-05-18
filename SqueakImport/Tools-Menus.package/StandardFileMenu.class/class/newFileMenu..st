instance creation
newFileMenu: aDirectory
	Smalltalk isMorphic ifFalse: [^ PluggableFileList newFileMenu: aDirectory].
	^ super new newFileFrom: aDirectory