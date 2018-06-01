as yet unclassified
refresh
	
	self setItem: (self parent contents
		at: self index
		ifAbsent: [self error: 'No support for changed child count yet!'])
			item.