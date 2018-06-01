browse
browseAllCallsOn: aLiteral localTo: aBehavior
	"Create and schedule a message browser on each method in or below the given class that refers to aLiteral."
	"self default browseAllCallsOn: #open:label: localTo: CodeHolder"

	aBehavior ifNil: [ ^self inform: 'No behavior selected.' ].
	self headingAndAutoselectForLiteral: aLiteral do: [ :label :autoSelect |
		self
			browseMessageList:  [ self allCallsOn: aLiteral from: aBehavior ]
			name: label, ' local to ', aBehavior name
			autoSelect: autoSelect ]