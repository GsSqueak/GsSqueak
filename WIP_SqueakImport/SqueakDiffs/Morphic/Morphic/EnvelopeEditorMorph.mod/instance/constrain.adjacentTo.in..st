editing
constrain: xVal adjacentTo: ix in: points
	"Return xVal, restricted between points adjacent to vertX"
	| newVal |
	newVal := xVal.
	ix > 1 ifTrue: [newVal := newVal max: (points at: ix-1) x].
	ix < points size ifTrue: [newVal := newVal min: (points at: ix+1) x].
	^ newVal