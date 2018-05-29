code pane menu
debuggerCodePaneMenu: aMenu
	<codePaneMenu>
	<menuPriority: 200>
	^ aMenu
		add: 'run to here' target: self selector: #runToSelection: argument: self codePaneSelectionInterval;
		add: 'run until...' target: self selector: #runUntil;
		addLine;
		yourself
