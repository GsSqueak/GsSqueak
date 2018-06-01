geometry
recomputeBounds

	| bnds |
	bnds := submorphs first bounds.
	bounds := bnds origin corner: bnds corner. "copy it!"
	fullBounds := nil.
	bounds := self fullBounds.
