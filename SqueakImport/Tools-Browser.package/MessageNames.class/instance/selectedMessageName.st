message list
selectedMessageName
	selectorList basicSize = 0 ifTrue: [^ nil]. "Deals with selectorList nil or empty"
	^selectorList at: (selectorListIndex max: 1) ifAbsent: [nil] "If no selection we can still find a selector"