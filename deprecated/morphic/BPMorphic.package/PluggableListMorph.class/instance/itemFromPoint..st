accessing
itemFromPoint: aPoint 
	"Return the list element (morph) at the given point or nil if outside"
	| _gsSqueakTemp_ptY |
	scroller hasSubmorphs
		ifFalse: [^ nil].
	(scroller fullBounds containsPoint: aPoint)
		ifFalse: [^ nil].
	_gsSqueakTemp_ptY := (scroller firstSubmorph point: aPoint from: self) y.
	"note: following assumes that submorphs are vertical, non-overlapping,
	and ordered"
	scroller firstSubmorph top > _gsSqueakTemp_ptY
		ifTrue: [^ nil].
	scroller lastSubmorph bottom < _gsSqueakTemp_ptY
		ifTrue: [^ nil].
	"now use binary search"
	^ scroller
		findSubmorphBinary: [:item | (item top <= _gsSqueakTemp_ptY
					and: [item bottom >= _gsSqueakTemp_ptY])
				ifTrue: [0
					"found"]
				ifFalse: [item top + item bottom // 2 > _gsSqueakTemp_ptY
						ifTrue: [-1]
						ifFalse: [1]]]