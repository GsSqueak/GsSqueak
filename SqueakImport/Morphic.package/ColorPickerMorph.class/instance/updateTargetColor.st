private
updateTargetColor
	| nArgs |
	(target notNil and: [selector notNil]) 
		ifTrue: 
			[self updateSelectorDisplay.
			nArgs := selector numArgs.
			nArgs = 1 ifTrue: [^target perform: selector with: selectedColor].
			nArgs = 2 
				ifTrue: 
					[^target 
						perform: selector
						with: selectedColor
						with: sourceHand].
			nArgs = 3 
				ifTrue: 
					[^target 
						perform: selector
						with: selectedColor
						with: argument
						with: sourceHand]]