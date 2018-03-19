helpers
codeForResolving: aSymbol inSymbolList: symbolListProxy

	^ '(' , symbolListProxy codeReferencingMe , ' objectNamed: #''' , aSymbol , ''')'.