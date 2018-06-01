private
global: ref name: name 
	^ self
		name: name
		key: ref
		class: SqLiteralVariableNode
		type: LdLitIndType
		set: litIndSet