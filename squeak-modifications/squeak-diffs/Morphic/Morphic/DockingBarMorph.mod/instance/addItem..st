construction
addItem: aBlock
	| item |
	item := DockingBarItemMorph new.
	aBlock value: item.
	self addMorphBack: item