interface
classNamed: aSymbol

	^ self fetchClass: (self codeReferencingClassNamed: aSymbol) forEnvironment: self