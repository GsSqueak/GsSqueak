loading - original classes
originalClassNamed: className

	^ GSSUnmodifiedClass newFromClass: (self environment classNamed: className asSymbol)