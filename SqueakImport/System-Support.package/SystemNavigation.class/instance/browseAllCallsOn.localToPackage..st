browse
browseAllCallsOn: aLiteral localToPackage: packageNameOrInfo
	"Create and schedule a message browser on each method in the given package that refers to aLiteral."
	"self default browseAllCallsOn: #open:label: localToPackage: 'Tools'."

	self headingAndAutoselectForLiteral: aLiteral do: [ :label :autoSelect |
		self
			browseMessageList: [ 
				self 
					allCallsOn: aLiteral
					localToPackage: packageNameOrInfo ]
			name: label, ' local to package ', (self packageInfoFor: packageNameOrInfo) name
			autoSelect: autoSelect ]