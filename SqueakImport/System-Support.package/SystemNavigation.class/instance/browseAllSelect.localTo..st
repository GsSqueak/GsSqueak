browse
browseAllSelect: aBlock localTo: aClass
	"Create and schedule a message browser on each method in or below the given class
	 that, when used as the block argument to aBlock gives a true result. For example,  
	 SystemNavigation default browseAllSelect: [:m | m numLiterals > 10] localTo: Morph."
	aClass ifNil: [^self inform: 'no class selected'].
	^self
		browseMessageList: (self allMethodsSelect: aBlock localTo: aClass) sorted
		name: 'selected messages local to ', aClass name