visiting
visitFutureNode: aFutureNode 
	aFutureNode receiver accept: self.
	(aFutureNode originalSelector isKindOf: SqSelectorNode)
		ifTrue: [aFutureNode originalSelector accept: self]