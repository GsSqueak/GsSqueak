event handling
itemFromPoint: aPoint
	"Return the list element (morph) at the given point or nil if outside"
	| ptY visibleRows |
	scroller hasSubmorphs ifFalse:[^nil].
	(scroller fullBounds containsPoint: aPoint) ifFalse:[^nil].
	
	visibleRows := scroller submorphs select: [:m | m visible].
	
	ptY := (visibleRows first point: aPoint from: self) y.
	"note: following assumes that submorphs are vertical, non-overlapping, and ordered"
	visibleRows first top > ptY ifTrue:[^nil].
	visibleRows last bottom < ptY ifTrue:[^nil].
	"now use binary search"
	^visibleRows
		findBinary:[:item|
			(item top <= ptY and:[item bottom >= ptY])
				ifTrue:[0] "found"
				ifFalse:[ (item top + item bottom // 2) > ptY ifTrue:[-1] ifFalse:[1]]]
		ifNone: [nil]