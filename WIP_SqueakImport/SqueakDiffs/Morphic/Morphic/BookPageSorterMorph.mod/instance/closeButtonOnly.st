as yet unclassified
closeButtonOnly
	"Replace my default control panel with one that has only a close button."

	| b r |
	self firstSubmorph delete.  "remove old control panel"
	b := SimpleButtonMorph new target: self; borderColor: Color black.
	r := AlignmentMorph newRow.
	r color: b color; borderWidth: 0; layoutInset: 0.
	r hResizing: #shrinkWrap; vResizing: #shrinkWrap; extent: 5@5.
	r wrapCentering: #topLeft.
	r addMorphBack: (b label: 'Close' translated; actionSelector: #delete).
	self addMorphFront: r.
