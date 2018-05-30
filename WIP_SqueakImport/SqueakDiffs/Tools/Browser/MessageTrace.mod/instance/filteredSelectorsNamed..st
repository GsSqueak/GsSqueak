filtering
filteredSelectorsNamed: selectorSymbol

	^(SystemNavigation for: self environment) allImplementorsOf: selectorSymbol
