mvc compatibility
zapSelectionWith: replacement 
	| _gsSqueakTemp_start _gsSqueakTemp_stop _gsSqueakTemp_rep |
	morph readOnly
		ifTrue: [^ self].
	self deselect.
	_gsSqueakTemp_start := self startIndex.
	_gsSqueakTemp_stop := self stopIndex.
	(replacement isEmpty
			and: [_gsSqueakTemp_stop > _gsSqueakTemp_start])
		ifTrue: ["If deleting, then set emphasisHere from 1st character of the
			deletion "
			emphasisHere := (self text attributesAt: _gsSqueakTemp_start)
						select: [:att | att mayBeExtended]].
	(_gsSqueakTemp_start = _gsSqueakTemp_stop
			and: [replacement isEmpty])
		ifFalse: [replacement isText
				ifTrue: [_gsSqueakTemp_rep := replacement]
				ifFalse: [_gsSqueakTemp_rep := Text string: replacement attributes: emphasisHere].
			self text
				replaceFrom: _gsSqueakTemp_start
				to: _gsSqueakTemp_stop - 1
				with: _gsSqueakTemp_rep.
			paragraph
				recomposeFrom: _gsSqueakTemp_start
				to: _gsSqueakTemp_start + _gsSqueakTemp_rep size - 1
				delta: _gsSqueakTemp_rep size - (_gsSqueakTemp_stop - _gsSqueakTemp_start).
			self markIndex: _gsSqueakTemp_start pointIndex: _gsSqueakTemp_start + _gsSqueakTemp_rep size.
			otherInterval := self selectionInterval].
	self userHasEdited
	"-- note text now dirty"