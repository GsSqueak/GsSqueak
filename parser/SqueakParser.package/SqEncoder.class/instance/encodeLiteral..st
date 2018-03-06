encoding
encodeLiteral: object 
	^ self
		name: object
		key: object
		class: SqLiteralNode
		type: LdLitType
		set: litSet