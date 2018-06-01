class functions
classListMenu: aMenu shifted: shifted
	"Set up the menu to apply to the receiver's class list, honoring the #shifted boolean"
	^ self menu: aMenu for: #(classListMenu classListMenuShifted:) shifted: shifted.
