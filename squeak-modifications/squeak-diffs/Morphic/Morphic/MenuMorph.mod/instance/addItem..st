construction
addItem: aBlock
	| item |
	item := MenuItemMorph new.
	aBlock value: item.
	self addMenuItem: item