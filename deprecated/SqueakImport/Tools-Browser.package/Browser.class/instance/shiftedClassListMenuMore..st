class functions
shiftedClassListMenuMore: aMenu
	" The 'more..' link that toggles between unshifted and shifted menus
	in class lists "
	<classListMenuShifted: true>
	<menuPriority: 1000>
	^ aMenu addList: #(-
			('more...' offerUnshiftedClassListMenu 'return to the standard class-list menu'));
		yourself