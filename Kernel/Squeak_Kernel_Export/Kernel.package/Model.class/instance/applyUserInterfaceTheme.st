morphic ui
applyUserInterfaceTheme

	self dependents do: [:ea |
		ea isSystemWindow ifTrue: [
			ea refreshWindowColor]].