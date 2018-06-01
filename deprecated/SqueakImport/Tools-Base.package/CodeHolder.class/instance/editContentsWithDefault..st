contents
editContentsWithDefault: aBlock

	| selector |
	selector := EditContentsOptions
		at: self contentsSymbol
		ifAbsent: [^ aBlock value].
	^ self perform: selector
