selector list
selectorListMenu: aMenu
	"Answer the menu associated with the selectorList"
	^ self menu: aMenu for: #(selectorListMenu selectorListMenuShifted:)
