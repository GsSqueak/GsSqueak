page controls
showPageControls: controlSpecs  
	"Remove any existing page controls, and add fresh controls at the top of the receiver (or in position 2 if the receiver's first submorph is one with property #header).  Add a single column of controls."

	| pageControls column |
	self hidePageControls.
	column := AlignmentMorph newColumn beTransparent.
	pageControls := self makePageControlsFrom: controlSpecs.
	pageControls borderWidth: 0; layoutInset: 4.
	pageControls beSticky.
	pageControls setNameTo: 'Page Controls'.
	self setEventHandlerForPageControls: pageControls.
	column addMorphBack: pageControls.
	self addPageControlMorph: column