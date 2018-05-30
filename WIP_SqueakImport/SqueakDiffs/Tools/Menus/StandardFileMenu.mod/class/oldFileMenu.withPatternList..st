instance creation
oldFileMenu: aDirectory withPatternList: aPatternList

	Smalltalk isMorphic ifFalse: [^PluggableFileList oldFileMenu: aDirectory].
	^super new oldFileFrom: aDirectory withPatternList: aPatternList