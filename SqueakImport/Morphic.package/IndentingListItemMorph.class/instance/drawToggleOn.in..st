drawing
drawToggleOn: aCanvas in: aRectangle

	| aForm centeringOffset |
	complexContents hasContents ifFalse: [^self].
	aForm := isExpanded 
		ifTrue: [container expandedForm]
		ifFalse: [container notExpandedForm].
	centeringOffset := ((aRectangle height - aForm extent y) / 2.0) rounded.
	^aCanvas 
		paintImage: aForm 
		at: (aRectangle topLeft translateBy: 0 @ centeringOffset).
