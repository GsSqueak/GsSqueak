private
unapplyAttribute: aTextAttribute
	"The user selected aTextAttribute to be removed.
	If there is a selection, unapply the attribute to the selection.
	In any case do not use the attribute for the user input (emphasisHere)"

	| interval |

	emphasisHere := emphasisHere copyWithout: aTextAttribute.

	interval := self selectionInterval.
	(interval isEmpty and: [ aTextAttribute isParagraphAttribute not ])
		ifTrue: [ ^self ].
	
	self text removeAttribute: aTextAttribute from: interval first to: interval last.
	paragraph recomposeFrom: interval first to: interval last delta: 0.
	self recomputeSelection.	"Needed so visible selection is updated to reflect new visual extent of selection"
	morph changed