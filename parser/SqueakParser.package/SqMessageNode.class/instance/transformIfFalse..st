macro transformations
transformIfFalse: encoder 
	(self transformBoolean: encoder)
		ifTrue: [arguments := Array
						with: ((SqBlockNode withJust: NodeNil)
								noteOptimizedIn: self)
						with: ((arguments at: 1)
								noteOptimizedIn: self).
			^ true]
		ifFalse: [^ false]