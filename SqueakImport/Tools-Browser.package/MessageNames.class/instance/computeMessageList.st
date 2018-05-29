search
computeMessageList

	^ selectorListIndex = 0
		ifTrue: [#()]
		ifFalse: [self systemNavigation
			allImplementorsOf: (selectorList at: selectorListIndex)]