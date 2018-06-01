-Tools-yellow button menu
codePaneMenu: aMenu shifted: shifted 
	"Utility method for the 'standard' codePane menu"
	aMenu
		addList: (shifted
				ifTrue: [self shiftedYellowButtonMenuItems]
				ifFalse: [self yellowButtonMenuItems]).
	^ aMenu