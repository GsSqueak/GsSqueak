class initialization
initialize
	"VariableNode initialize. Decompiler initialize"
	| encoder |
	LdMinus1 ifNil: [SqParseNode initialize].
	encoder := SqEncoder new.
	StdVariables := Dictionary new: 16.
	encoder
		fillDict: StdVariables
		with: SqVariableNode
		mapping: #('self' 'thisContext' 'super' 'nil' 'false' 'true')
		to: (Array
				with: LdSelf
				with: LdThisContext
				with: LdSuper)
				, (Array
						with: LdNil
						with: LdFalse
						with: LdTrue).
	StdSelectors := Dictionary new: 64.
	encoder
		fillDict: StdSelectors
		with: SqSpecialSelectorNode
		mapping: ((1 to: Smalltalk specialSelectorSize)
				collect: [:i | Smalltalk specialSelectorAt: i])
		to: (1 to: Smalltalk specialSelectorSize) asArray.
	StdLiterals := PluggableDictionary new
				equalBlock: [:x :y | x literalEqual: y].
	encoder
		fillDict: StdLiterals
		with: SqLiteralNode
		mapping: #(-1 0 1 2)
		to: (LdMinus1 to: LdMinus1 + 3).
	encoder initScopeAndLiteralTables.
	NodeNil := encoder encodeVariable: 'nil'.
	NodeTrue := encoder encodeVariable: 'true'.
	NodeFalse := encoder encodeVariable: 'false'.
	NodeSelf := encoder encodeVariable: 'self'.
	NodeThisContext := encoder encodeVariable: 'thisContext'.
	NodeSuper := encoder encodeVariable: 'super'