as yet unclassified
cancelSort
	| oldOwner |
	oldOwner := owner.
	self delete.
	oldOwner addMorphFront: book