-Tools-code pane menu
mainCodePaneMenu: aMenu shifted: shifted 
	"Fill in the given menu with additional items. The menu is prepoulated
	with the 'standard' text commands that the editor supports. Note
	that unless we override perform:orSendTo:, the editor will respond to
	all menu items in a text pane"
	^ self class codePaneMenu: aMenu shifted: shifted