query assembly
codeReferencingClassNamed: aSymbol

	^ '(' , self codeReferencingMe ,
		' classNamed: ' , aSymbol asSymbol printString , ')'