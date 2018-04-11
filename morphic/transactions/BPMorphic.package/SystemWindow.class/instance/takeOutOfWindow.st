menu
takeOutOfWindow
	"Take the receiver's pane morph out the window and place it, naked,
	where once the window was"
	| _gsSqueakTemp_aMorph |
	paneMorphs size = 1
		ifFalse: [^ Beeper beep].
	_gsSqueakTemp_aMorph := paneMorphs first.
	owner addMorphFront: _gsSqueakTemp_aMorph.
	self delete