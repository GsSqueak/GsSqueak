initialization
initialize
	"Initialize the receiver."

	super initialize.
	self removeAllMorphs.

	self extent: 300@100.
	pageHolder := PasteUpMorph new.
	pageHolder vResizeToFit: true; autoLineLayout: true.
	pageHolder extent: self extent - borderWidth.
	pageHolder padding: 8.
	pageHolder cursor: 0.
	pageHolder wantsMouseOverHalos: false.
	self addControls.
	self addMorphBack: pageHolder