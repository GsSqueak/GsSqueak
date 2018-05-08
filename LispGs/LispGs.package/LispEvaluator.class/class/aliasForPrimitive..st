private
aliasForPrimitive: aSymbol 
	| alias |
	alias := aSymbol allButLast.
	alias := alias copyReplaceAll: 'LISP' with: ''.
	(aSymbol endsWith: 'P:')
		ifTrue: [alias := alias allButLast , '?'].
	(aSymbol endsWith: 'D:')
		ifTrue: [alias := alias allButLast , '!'].
	(aSymbol endsWith: 'Star:')
		ifTrue: [alias := (alias allButLast: 4) , '*'].
	alias := alias copyReplaceAll: 'ONE' with: '-1'.
	alias := alias copyReplaceAll: 'TO' with: '->'.
	(alias	detect: [:c | c isUppercase]
		ifNone: [])
		ifNotNil: [alias := alias linkAtCaps].
	^ alias asSymbol
