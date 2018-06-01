event handling
menuButtonMouseDown: event 
	event hand showTemporaryCursor: nil.
	self
		use: menuSelector
		orMakeModelSelectorFor: 'MenuButtonPressed:'
		in: [:sel | 
			menuSelector := sel.
			model perform: sel with: event]