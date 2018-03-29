debug printing
printStackPagesInUse
	| _gsSqueakTemp_n |
	_gsSqueakTemp_n := 0.
	0
		to: numStackPages - 1
		do: [:i | (stackPages
					isFree: (stackPages stackPageAt: i))
				ifFalse: [self
						printStackPage: (stackPages stackPageAt: i)
						useCount: (_gsSqueakTemp_n := _gsSqueakTemp_n + 1);
						 cr]]