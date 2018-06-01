browse
browseAllCallsOn: aLiteral fromMethodReferences: methodReferences labelled: sourceLabel
	"Create and schedule a Message Set browser for all the methods that call on aLiteral within methodReferences."

	^self
		headingAndAutoselectForLiteral: aLiteral
		do: [ :label :autoSelect |
			self 
				browseMessageList: [self allCallsOn: aLiteral
										fromMethodReferences: methodReferences
										sorted: true]
				name: label, ' from ', sourceLabel
				autoSelect: autoSelect]