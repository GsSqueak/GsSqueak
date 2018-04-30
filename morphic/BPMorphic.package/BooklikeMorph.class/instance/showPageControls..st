page controls
showPageControls: controlSpecs 
	"Remove any existing page controls, and add fresh controls at the top
	of the receiver (or in position 2 if the receiver's first submorph is one
	with property #header). Add a single column of controls."
	| _gsSqueakTemp_pageControls _gsSqueakTemp_column |
	self hidePageControls.
	_gsSqueakTemp_column := AlignmentMorph newColumn beTransparent.
	_gsSqueakTemp_pageControls := self makePageControlsFrom: controlSpecs.
	_gsSqueakTemp_pageControls borderWidth: 0;
		 layoutInset: 4.
	_gsSqueakTemp_pageControls beSticky.
	_gsSqueakTemp_pageControls setNameTo: 'Page Controls'.
	self setEventHandlerForPageControls: _gsSqueakTemp_pageControls.
	_gsSqueakTemp_column addMorphBack: _gsSqueakTemp_pageControls.
	self addPageControlMorph: _gsSqueakTemp_column