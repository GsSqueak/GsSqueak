sub-projects & hierarchy
withChildrenDo: aBlock
	"Evaluate the block first with the receiver as argument, then, recursively and depth first, with each of the receiver's children as argument"
	
	aBlock value: self.
	self children do: [:p | 
		p withChildrenDo: aBlock ]