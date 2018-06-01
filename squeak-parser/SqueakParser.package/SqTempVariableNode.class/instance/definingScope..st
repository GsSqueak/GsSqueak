closure analysis
definingScope: scopeBlock 
	"<BlockNode>"
	definingScope = scopeBlock
		ifTrue: [^ self].
	"No need to bail"
	definingScope
		ifNotNil: [self error: 'temp has more than one defining scope.  This is probably a parser error'].
	definingScope := scopeBlock