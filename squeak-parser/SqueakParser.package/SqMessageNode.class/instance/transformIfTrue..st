macro transformations
transformIfTrue: encoder 
	(self transformBoolean: encoder)
		ifTrue: [arguments := Array
						with: ((arguments at: 1)
								noteOptimizedIn: self)
						with: ((SqBlockNode withJust: NodeNil)
								noteOptimizedIn: self).
			^ true]
		ifFalse: [^ false]