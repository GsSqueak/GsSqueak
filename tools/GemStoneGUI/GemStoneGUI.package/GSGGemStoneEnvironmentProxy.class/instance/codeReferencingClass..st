query assembly
codeReferencingClass: classProxy

	^ '(' , self codeReferencingMe , ' objectNamed: ' , classProxy name printString , ')'