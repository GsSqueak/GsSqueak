initialization
addControls
	"Add the control bar at the top of the tool."

	| b r |
	b := SimpleButtonMorph new target: self; borderColor: Color black.
	r := AlignmentMorph newRow.
	r color: b color; borderWidth: 0; layoutInset: 0.
	r hResizing: #shrinkWrap; vResizing: #shrinkWrap; extent: 5@5.
	r wrapCentering: #topLeft.
	r addMorphBack: (b label: 'Okay' translated font: ScriptingSystem fontForEToyButtons;	actionSelector: #acceptSort).
	b := SimpleButtonMorph new target: self; borderColor: Color black.
	r addMorphBack: (b label: 'Cancel' translated font: ScriptingSystem fontForEToyButtons;	actionSelector: #cancelSort).
	self addMorphFront: r.
