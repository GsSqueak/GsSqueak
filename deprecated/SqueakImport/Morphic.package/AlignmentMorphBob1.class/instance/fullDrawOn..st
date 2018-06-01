as yet unclassified
fullDrawOn: aCanvas

	| mask |
	(aCanvas isVisible: self fullBounds) ifFalse:[^self].
	super fullDrawOn: aCanvas.
	mask := self valueOfProperty: #disabledMaskColor ifAbsent: [^self].
	aCanvas fillRectangle: bounds color: mask.
