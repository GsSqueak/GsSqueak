instance creation
newFileMenu: aDirectory withPatternList: aPatternList
	Smalltalk isMorphic ifFalse: [^ PluggableFileList newFileMenu: aDirectory].
	^ super new newFileFrom: aDirectory withPatternList: aPatternList