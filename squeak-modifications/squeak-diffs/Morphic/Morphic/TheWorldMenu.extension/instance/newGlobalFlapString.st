*Morphic-MorphicExtras-windows & flaps menu
newGlobalFlapString
	"Answer a string for the new-global-flap item in the flap menu.  Obsolete; retained momentarily for the benefit of preexisting persistent menus."

	self flag: #toRemove.
	^ 'make a new shared flap'