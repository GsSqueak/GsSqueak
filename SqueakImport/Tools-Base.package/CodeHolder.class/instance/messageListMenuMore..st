message list menu
messageListMenuMore: aMenu
	" The 'more..' link that toggles between shifted and unshifted menus
	in message lists and context stacks "
	<messageListMenuShifted: false>
	<contextStackMenuShifted: false>
	<menuPriority: 1000>
	^ aMenu addList: #(
			-
			('more...'				shiftedYellowButtonActivity));
		yourself
