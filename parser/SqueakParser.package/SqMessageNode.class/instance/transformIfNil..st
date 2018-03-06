macro transformations
transformIfNil: encoder 
	"vb: Removed the original transformBoolean: which amounds to a test
	we perform in each of the branches below."
	(MacroSelectors at: special)
			= #ifNotNil:
		ifTrue: [(self
					checkBlock: arguments first
					as: 'ifNotNil arg'
					from: encoder
					maxArgs: 1)
				ifFalse: [^ false].
			"Transform 'ifNotNil: [stuff]' to 'ifNil: [nil] ifNotNil: [stuff]'.
			Slightly better code and more consistent with decompilation."
			self noteSpecialSelector: #ifNil:ifNotNil:.
			selector := SqSelectorNode new
						key: (MacroSelectors at: special)
						code: #macro.
			arguments := Array
						with: ((SqBlockNode withJust: NodeNil)
								noteOptimizedIn: self)
						with: (arguments first noteOptimizedIn: self).
			(self transform: encoder)
				ifFalse: [self error: 'compiler logic error'].
			^ true].
	(self
			checkBlock: arguments first
			as: 'ifNil arg'
			from: encoder
			maxArgs: 0)
		ifFalse: [^ false].
	arguments first noteOptimizedIn: self.
	^ true