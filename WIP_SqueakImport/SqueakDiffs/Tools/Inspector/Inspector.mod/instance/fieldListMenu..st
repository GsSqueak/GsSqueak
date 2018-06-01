menu commands
fieldListMenu: aMenu
	"Arm the supplied menu with items for the field-list of the receiver"
	^ self menu: aMenu for: #(fieldListMenu fieldListMenuShifted:)
