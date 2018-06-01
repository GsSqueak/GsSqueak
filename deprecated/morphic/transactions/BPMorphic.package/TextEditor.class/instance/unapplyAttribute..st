private
unapplyAttribute: aTextAttribute 
	"The user selected aTextAttribute to be removed.
	If there is a selection, unapply the attribute to the selection.
	In any case do not use the attribute for the user input
	(emphasisHere) "
	| _gsSqueakTemp_interval |
	emphasisHere := emphasisHere copyWithout: aTextAttribute.
	_gsSqueakTemp_interval := self selectionInterval.
	(_gsSqueakTemp_interval isEmpty
			and: [aTextAttribute isParagraphAttribute not])
		ifTrue: [^ self].
	self text
		removeAttribute: aTextAttribute
		from: _gsSqueakTemp_interval first
		to: _gsSqueakTemp_interval last.
	paragraph
		recomposeFrom: _gsSqueakTemp_interval first
		to: _gsSqueakTemp_interval last
		delta: 0.
	self recomputeSelection.
	"Needed so visible selection is updated to reflect new visual extent of
	selection "
	morph changed