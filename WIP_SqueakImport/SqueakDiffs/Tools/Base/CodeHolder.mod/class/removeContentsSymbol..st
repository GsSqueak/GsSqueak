controls
removeContentsSymbol: aSymbol 
	"Unregister the menu selection item with selection symbol aSymbol."

	"CodeHolder removeContentsSymbol: #altSyntax"

	| entries |
	entries := ContentsSymbolQuints
		select: [:e | (e isKindOf: Collection) and: [e first = aSymbol]].
	ContentsSymbolQuints removeAll: entries.
	^ entries
