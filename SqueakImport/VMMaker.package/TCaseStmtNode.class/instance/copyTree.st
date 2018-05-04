as yet unclassified
copyTree

	^self class new
		setExpression: expression copyTree
		firsts: firsts copy
		lasts: lasts copy
		cases: (cases collect: [ :case | case copyTree ])