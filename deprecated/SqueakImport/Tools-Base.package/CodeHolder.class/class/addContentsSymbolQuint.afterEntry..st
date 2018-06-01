controls
addContentsSymbolQuint: quint afterEntry: aSymbol 
	"Register a menu selection item in the position after the entry with
	selection symbol aSymbol."

	"CodeHolder
		addContentsSymbolQuint: #(#altSyntax #toggleAltSyntax #showingAltSyntaxString 'altSyntax' 'alternative syntax')
		afterEntry: #colorPrint"

	(ContentsSymbolQuints
		anySatisfy: [:e | (e isKindOf: Collection) and: [e first = quint first]])
		ifFalse: [
			| entry |
			entry := ContentsSymbolQuints
						detect: [:e | (e isKindOf: Collection) and: [e first = aSymbol]].
			ContentsSymbolQuints add: quint after: entry.
			^ self].
	self notify: 'entry already exists for ', quint first