class functions
classListMenuMore: aMenu 
	" The 'more..' link that toggles between shifted and unshifted menus
	in class lists "
	<classListMenuShifted: false>
	<menuPriority: 1000>
	^ aMenu addList: #(- ('more...'	offerShiftedClassListMenu)); yourself
