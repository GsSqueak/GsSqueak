-Etoys-universal slots & scripts
doesOperatorWantArrows: aSymbol 
	aSymbol = #,
		ifTrue: [^ false].
	^ aSymbol isInfix
		or: [#(#isDivisibleBy: ) includes: aSymbol]