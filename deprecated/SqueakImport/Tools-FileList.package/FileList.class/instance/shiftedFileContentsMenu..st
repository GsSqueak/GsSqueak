file list menu
shiftedFileContentsMenu: aMenu
	"Delegate the shifted menu to the default shifted menu"
	<fileContentsMenuShifted: true>
	^ aMenu addList: self class shiftedYellowButtonMenuItems; yourself
