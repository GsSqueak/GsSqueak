-Etoys
noteAddedSelector: aSelector meta: isMeta 
	[aSelector == #wordingForOperator:
		ifTrue: [Vocabulary changeMadeToViewerAdditions]]
		on: Error
		do: [].
	super noteAddedSelector: aSelector meta: isMeta