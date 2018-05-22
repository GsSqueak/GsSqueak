instance creation
oldFileMenu: aDirectory withPattern: aPattern

	Smalltalk isMorphic ifFalse: [^PluggableFileList oldFileMenu: aDirectory].
	^super new oldFileFrom: aDirectory withPattern: aPattern