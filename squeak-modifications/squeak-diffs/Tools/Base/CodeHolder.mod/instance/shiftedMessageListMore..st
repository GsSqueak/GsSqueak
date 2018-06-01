message list menu
shiftedMessageListMore: aMenu
	" The 'more..' link that toggles between shifted and unshifted menus
	in message lists and context stacks "
	<messageListMenuShifted: true>
	<contextStackMenuShifted: true>
	<menuPriority: 1000>
	^ aMenu addList: #(
			-
			('more...'				unshiftedYellowButtonActivity));
		yourself
