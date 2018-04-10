private
applyAttribute: aTextAttribute 
	"The user selected aTextAttribute via shortcut, menu or other means.
	If there is a selection, apply the attribute to the selection.
	In any case use the attribute for the user input (emphasisHere)"
	| _gsSqueakTemp_interval |
	emphasisHere := Text addAttribute: aTextAttribute toArray: emphasisHere.
	_gsSqueakTemp_interval := self selectionInterval.
	(_gsSqueakTemp_interval isEmpty
			and: [aTextAttribute isParagraphAttribute not])
		ifTrue: [^ self].
	self text
		addAttribute: aTextAttribute
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