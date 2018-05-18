drop shadows
shadowPoint: newPoint
	"Can be reset in #addDropShadow."
	
	| delta |
	delta := newPoint - self center.
	self shadowOffset: (self useSoftDropShadow
		ifTrue: [(10@8 corner: 10@12) outsetBy: delta]
		ifFalse: [delta]).

