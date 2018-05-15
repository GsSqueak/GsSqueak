browse
browseAllCallsOn: aLiteral 
	"Create and schedule a message browser on each method that refers to aLiteral."
	"self default browseAllCallsOn: #open:label:."

	self headingAndAutoselectForLiteral: aLiteral do: [ :label :autoSelect |
		self
			browseMessageList: [ self allCallsOn: aLiteral ]
			name: label
			autoSelect: autoSelect]