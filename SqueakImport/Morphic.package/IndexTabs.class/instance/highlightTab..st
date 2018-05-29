highlighting
highlightTab: aTab
	self tabMorphs do:
		[:m | m == aTab
			ifTrue: [m highlight]
			ifFalse: [m unHighlight]]