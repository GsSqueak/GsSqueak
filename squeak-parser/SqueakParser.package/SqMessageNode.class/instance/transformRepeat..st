macro transformations
transformRepeat: encoder 
	"answer true if this #repeat message can be optimized"
	^ (self
			checkBlock: receiver
			as: 'receiver'
			from: encoder
			maxArgs: 0)
		and: [receiver noteOptimizedIn: self.
			true]