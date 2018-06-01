macro transformations
transformIfTrueIfFalse: encoder 
	^ (self
			checkBlock: (arguments at: 1)
			as: 'True arg'
			from: encoder
			maxArgs: 0)
		and: [(self
					checkBlock: (arguments at: 2)
					as: 'False arg'
					from: encoder
					maxArgs: 0)
				and: [arguments
						do: [:arg | arg noteOptimizedIn: self].
					true]]