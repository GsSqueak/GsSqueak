loading
loadOriginalClassNamed: aSymbol

	| class |
	class := self environment classNamed: aSymbol.
	self classDefinitions at: aSymbol put: (GSSUnmodifiedClass newFromClass: class)