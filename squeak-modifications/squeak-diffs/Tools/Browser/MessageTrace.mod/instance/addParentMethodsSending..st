building
addParentMethodsSending: selectorSymbol

	| methodsList |
	(methodsList := self systemNavigation allCallsOn: selectorSymbol) isEmpty
		ifTrue:
			[ ^(PopUpMenu labels: ' OK ')
				startUpWithCaption: 'There are no methods that send ', selectorSymbol ]
		ifFalse:
			[ self
				addParentMessages: methodsList
				autoSelectString: selectorSymbol ]
