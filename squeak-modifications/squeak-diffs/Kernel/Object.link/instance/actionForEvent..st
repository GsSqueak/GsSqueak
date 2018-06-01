*System-Object Events-accessing
actionForEvent: anEventSelector
    "Answer the action to be evaluated when <anEventSelector> has been triggered."

	^self actionMap
		at: anEventSelector asSymbol
		ifAbsent: [nil]