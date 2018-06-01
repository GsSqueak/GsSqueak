private
isDisjointFrom: anInterval 
	"Answer true if anInterval is a caret not touching or within the current
	interval, or if anInterval is a non-caret that does not overlap the
	current selection."
	| _gsSqueakTemp_fudge |
	_gsSqueakTemp_fudge := anInterval size = 0
				ifTrue: [1]
				ifFalse: [0].
	^ anInterval last + _gsSqueakTemp_fudge < self startIndex
		or: [anInterval first - _gsSqueakTemp_fudge >= self stopIndex]