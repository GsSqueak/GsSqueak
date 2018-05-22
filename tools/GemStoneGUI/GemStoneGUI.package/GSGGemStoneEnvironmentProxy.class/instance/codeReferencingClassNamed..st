query assembly
codeReferencingClassNamed: aSymbol

	^ '({1} objectNamed: {2})' format: {
			self codeReferencingMe.
			aSymbol storeString}