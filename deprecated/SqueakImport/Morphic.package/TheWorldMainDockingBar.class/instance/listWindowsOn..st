submenu - windows
listWindowsOn: menu

	| windows |
	windows := self allVisibleWindows sorted: [:winA :winB |
		((winA model isNil or: [winB model isNil]) or: [winA model name = winB model name])
			ifTrue: [winA label < winB label]
			ifFalse: [winA model name < winB model name]].
	windows ifEmpty: [ 
		menu addItem: [ :item | 
			item
				contents: 'No Windows' translated;
				isEnabled: false ] ].
	windows do: [ :each |
		| windowColor |
		windowColor := (each model respondsTo: #windowColorToUse)
			ifTrue: [each model windowColorToUse]
			ifFalse: [UserInterfaceTheme current get: #uniformWindowColor for: Model]. 
		menu addItem: [ :item |
			item 
				contents: (self windowMenuItemLabelFor: each);
				icon: (self colorIcon: windowColor);
				target: each;
				selector: #comeToFront;
				subMenuUpdater: self
				selector: #windowMenuFor:on:
				arguments: { each };
				action: [ each beKeyWindow; expand ] ] ].
	menu
		addLine;
		add: 'Close all windows' target: self selector: #closeAllWindowsUnsafe;
		addItem: [:item | item
			contents: 'Close all windows without changes';
			target: self;
			icon: MenuIcons smallBroomIcon;
			selector: #closeAllWindows];
		add: 'Close all windows but workspaces' target: self selector: #closeAllWindowsButWorkspaces.