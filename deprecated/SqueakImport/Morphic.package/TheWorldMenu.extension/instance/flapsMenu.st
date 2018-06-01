*Morphic-MorphicExtras-windows & flaps menu
flapsMenu
	"Build the flaps menu for the world."

	| aMenu |
	aMenu := UpdatingMenuMorph new updater: self updateSelector: #formulateFlapsMenu:.
	self formulateFlapsMenu: aMenu.
	^ aMenu