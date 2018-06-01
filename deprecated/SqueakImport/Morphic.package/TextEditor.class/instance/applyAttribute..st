private
applyAttribute: aTextAttribute
	"The user selected aTextAttribute via shortcut, menu or other means.
	If there is a selection, apply the attribute to the selection.
	In any case use the attribute for the user input (emphasisHere)"
	| interval |

	emphasisHere := Text addAttribute: aTextAttribute toArray: emphasisHere.
	
	interval := self selectionInterval.
	(interval isEmpty and: [ aTextAttribute isParagraphAttribute not ])
		ifTrue: [ ^self ].
	
	self text addAttribute: aTextAttribute from: interval first to: interval last.
	paragraph recomposeFrom: interval first to: interval last delta: 0.
	self recomputeSelection.	"Needed so visible selection is updated to reflect new visual extent of selection"
	morph changed