instance creation
oldFileMenu: aDirectory
	Smalltalk isMorphic ifFalse: [^ PluggableFileList oldFileMenu: aDirectory].
	^ super new oldFileFrom: aDirectory