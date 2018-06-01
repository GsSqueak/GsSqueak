tabs
addTabFor: aReferent font: aFont
	|  aTab |
	aTab := ReferenceMorph forMorph: aReferent font: aFont.
	self addMorphBack: aTab.
	aTab highlightColor: self highlightColor; regularColor: self regularColor.
	aTab unHighlight.
	self laySubpartsOutInOneRow; layoutChanged.
	^ aTab