browse
browseAllSelect: aBlock localToPackage: packageNameOrInfo
	"Create and schedule a message browser on each method in the given package
	 that, when used as the block argument to aBlock answers true. For example,  
		(SystemNavigation new
			browseAllSelect: [:method | method scanFor: 138]
			localToPackage: #System.)"
	^self
		browseMessageList: (self allMethodsSelect: aBlock localToPackage: packageNameOrInfo)
		name: 'selected messages local to package ', (self packageInfoFor: packageNameOrInfo) name