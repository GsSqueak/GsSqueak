event handling
autoScrollView: evt 
	"This is kind of a hack because the PluggableTextMorph expects me to
	first expand the selection before auto scrolling will work."
	| _gsSqueakTemp_localEvt |
	_gsSqueakTemp_localEvt := evt
				transformedBy: (self transformedFrom: editView).
	super mouseMove: _gsSqueakTemp_localEvt.
	editView scrollSelectionIntoView: _gsSqueakTemp_localEvt