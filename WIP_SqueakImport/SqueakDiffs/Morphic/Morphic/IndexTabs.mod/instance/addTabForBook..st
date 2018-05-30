tabs
addTabForBook: aBook
	|  aTab |
	aTab := ReferenceMorph forMorph: aBook.
	self addMorphBack: aTab.
	aTab highlightColor: self highlightColor; regularColor: self regularColor.
	aTab unHighlight.
	self laySubpartsOutInOneRow; layoutChanged.
	^ aTab