browse
browseAllCallsOn: literal1 and: literal2 localToPackage: packageNameOrInfo
	"Create and schedule a message browser on each method in the given package that refers to both literal1 and literal2."
	"self default browseAllCallsOn: #open:label: localToPackage: 'Tools'."

	self headingAndAutoselectForLiteral: literal1 do: [ :label :autoSelect |
		self
			browseMessageList: [ 
				self 
					allCallsOn: literal1
					and: literal2
					localToPackage: packageNameOrInfo ]
			name: label, ' local to package ', (self packageInfoFor: packageNameOrInfo) name
			autoSelect: autoSelect ]