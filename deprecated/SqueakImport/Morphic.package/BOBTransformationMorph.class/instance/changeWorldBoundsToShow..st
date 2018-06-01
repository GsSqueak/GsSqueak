as yet unclassified
changeWorldBoundsToShow: aRectangle

	aRectangle area = 0 ifTrue: [^self].
	worldBoundsToShow := aRectangle.
	owner myWorldChanged.