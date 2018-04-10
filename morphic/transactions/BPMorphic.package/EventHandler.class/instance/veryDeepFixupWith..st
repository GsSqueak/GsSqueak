copying
veryDeepFixupWith: deepCopier 
	"ALL inst vars were weakly copied. If they were in the tree being
	copied, fix them up, otherwise point to the originals!!"
	| _gsSqueakTemp_old |
	super veryDeepFixupWith: deepCopier.
	1
		to: self class instSize
		do: [:ii | 
			_gsSqueakTemp_old := self instVarAt: ii.
			self
				instVarAt: ii
				put: (deepCopier references
						at: _gsSqueakTemp_old
						ifAbsent: [_gsSqueakTemp_old])]