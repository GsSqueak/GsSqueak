as yet unclassified
delete

	owner ifNotNil: [ 
		" When deleted remove my menu items, so I can avoid holding unwanted references to other objects. They will be updated anyway when I become visible again. "
		" The owner notNil condition is necessary because MenuItemMorph >> select: sends delete before I become visible, but after the menu items are updated. "
		self removeAllMorphs ].
	super delete