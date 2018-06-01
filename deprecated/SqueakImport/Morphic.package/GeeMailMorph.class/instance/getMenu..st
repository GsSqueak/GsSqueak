menu
getMenu: shiftKeyState

	| menu |

	self flag: #convertToBook.	"<-- no longer used"

	menu := MenuMorph new defaultTarget: self.
	self addGeeMailMenuItemsTo: menu.
	^menu