controls
addContentsSymbolQuint: quint afterPosition: index
	"Register a menu selection item in the position after index."

	"CodeHolder
		addContentsSymbolQuint: #(#altSyntax #toggleAltSyntax #showingAltSyntaxString 'altSyntax' 'alternative syntax')
		afterPosition: 1"

	| entry |
	entry := ContentsSymbolQuints at: index.
	self contentsSymbolQuints add: quint after: entry