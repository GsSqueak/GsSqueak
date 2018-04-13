query assembly
codeReferencingClassNamed: aSymbol

	^ '(' , self codeReferencingSymbolList , 
		' objectNamed: ' , aSymbol asSymbol printString , ')'