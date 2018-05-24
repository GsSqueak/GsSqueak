file list menu
fileSelectedMenu: aMenu
	| firstItems secondItems thirdItems n1 n2 n3 services |
	firstItems := self itemsForFile: self fullName asLowercase.
	secondItems := self itemsForAnyFile.
	thirdItems := self itemsForNoFile.
	n1 := firstItems size.
	n2 := n1 + secondItems size.
	n3 := n2 + thirdItems size.
	services := firstItems, secondItems, thirdItems, 
			(OrderedCollection with: (SimpleServiceEntry provider: self label: 'more...' selector: #offerAllFileOptions)).
	^ aMenu 
		addServices2: services 
		for: self
		extraLines: (Array with: n1 with: n2 with: n3)
