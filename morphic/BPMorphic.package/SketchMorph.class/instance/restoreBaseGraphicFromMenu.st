menu
restoreBaseGraphicFromMenu
	"Restore the base graphic -- invoked from a menu, so give interactive
	feedback if appropriate"
	self isInWorld
		ifFalse: [^ self inform: 'oops, this menu is a for a morph that
has been replaced, probably because a
"look like" script was run.  Please dismiss
the menu and get a new one!.  Sorry!' translated].
	self baseGraphic = originalForm
		ifTrue: [^ self inform: 'This object is *already* showing its baseGraphic' translated].
	self restoreBaseGraphic