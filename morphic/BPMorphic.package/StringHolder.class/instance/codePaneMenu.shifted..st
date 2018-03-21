-Tools-code pane menu
codePaneMenu: aMenu shifted: shifted 
	^ self
		menu: aMenu
		for: #(#codePaneMenu #codePaneMenuShifted: )
		shifted: shifted