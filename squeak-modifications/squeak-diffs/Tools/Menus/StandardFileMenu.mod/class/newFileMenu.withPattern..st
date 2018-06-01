instance creation
newFileMenu: aDirectory withPattern: aPattern
	Smalltalk isMorphic ifFalse: [^ PluggableFileList newFileMenu: aDirectory].
	^ super new newFileFrom: aDirectory withPattern: aPattern