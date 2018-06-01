building
addChildMethodsNamed: selectorSymbol

	| methodsReferences |

	messageListIndex = 0 
		ifTrue:
			[ ^(PopUpMenu labels: ' OK ')
				startUpWithCaption: 'Please reselect a method.' ].
	(methodsReferences := self filteredSelectorsNamed: selectorSymbol) isEmpty
		ifTrue:
			[ ^(PopUpMenu labels: ' OK ')
				startUpWithCaption: 'There are no methods named ', selectorSymbol ]
		ifFalse:
			[ self
				addChildMessages: methodsReferences
				autoSelectString: selectorSymbol ]
