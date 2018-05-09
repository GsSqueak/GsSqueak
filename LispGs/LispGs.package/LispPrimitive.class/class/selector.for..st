as yet unclassified
selector: aSymbol for: aLisp 
	(aLisp specialForms pointsTo: aSymbol)
		ifTrue: [^ LispPrimitiveSpecial new selector: aSymbol;
				 lisp: aLisp].
	^ self new selector: aSymbol;
		 lisp: aLisp
