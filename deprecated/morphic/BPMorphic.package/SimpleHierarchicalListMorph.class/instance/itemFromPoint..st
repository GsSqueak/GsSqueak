event handling
itemFromPoint: aPoint 
	"Return the list element (morph) at the given point or nil if outside"
	| _gsSqueakTemp_ptY _gsSqueakTemp_visibleRows |
	scroller hasSubmorphs
		ifFalse: [^ nil].
	(scroller fullBounds containsPoint: aPoint)
		ifFalse: [^ nil].
	_gsSqueakTemp_visibleRows := scroller submorphs
				select: [:m | m visible].
	_gsSqueakTemp_ptY := (_gsSqueakTemp_visibleRows first point: aPoint from: self) y.
	"note: following assumes that submorphs are vertical, non-overlapping,
	and ordered"
	_gsSqueakTemp_visibleRows first top > _gsSqueakTemp_ptY
		ifTrue: [^ nil].
	_gsSqueakTemp_visibleRows last bottom < _gsSqueakTemp_ptY
		ifTrue: [^ nil].
	"now use binary search"
	^ _gsSqueakTemp_visibleRows
		findBinary: [:item | (item top <= _gsSqueakTemp_ptY
					and: [item bottom >= _gsSqueakTemp_ptY])
				ifTrue: [0
					"found"]
				ifFalse: [item top + item bottom // 2 > _gsSqueakTemp_ptY
						ifTrue: [-1]
						ifFalse: [1]]]
		ifNone: []