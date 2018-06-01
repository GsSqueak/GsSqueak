initialization
addTabFor: aReferent font: aFont
	| aTab |
	aTab := tabsMorph addTabFor: aReferent font: aFont.
	pages add: aReferent.
	currentPage ifNil: [currentPage := aReferent].
	^ aTab