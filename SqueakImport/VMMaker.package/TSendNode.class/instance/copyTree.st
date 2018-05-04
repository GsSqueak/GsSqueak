accessing
copyTree

	^self class new
		setSelector: selector
		receiver: receiver copyTree
		arguments: (arguments collect: [ :arg | arg copyTree ])
		isBuiltInOp: isBuiltinOperator