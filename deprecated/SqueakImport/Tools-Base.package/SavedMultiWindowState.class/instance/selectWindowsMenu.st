operations
selectWindowsMenu
	| menu currentItem |
	menu := MenuMorph new defaultTarget: self.
	models withIndexDo:
		[:model :index| | modelLabel |
		modelLabel := index = currentModelIndex
							ifTrue: [model multiWindowName]
							ifFalse: [model multiWindowNameForState: (modelStates at: index) first].
		models size > 1 ifTrue:
			[modelLabel := index printString, '. ', modelLabel].
		menu
			add: (index = currentModelIndex
					ifTrue: [Text string: modelLabel attribute: TextEmphasis bold]
					ifFalse:
						[((modelStates at: index) last anySatisfy: [:editState| editState notNil])
							ifTrue: [Text string: modelLabel attribute: TextColor red]
							ifFalse: [modelLabel]])
			target: self
			selector: #selectWindowIndex:
			argument: index.
		index = currentModelIndex ifTrue:
			[currentItem := menu lastItem]].
	menu
		addLine;
		add: 'new window' target: self selector: #addNewWindow;
		add: 'copy this window' target: self selector: #copyWindow;
		add: 'remove this window' target: self selector: #removeCurrentWindow.
	models size <= 1 ifTrue:
		[menu lastItem isEnabled: false].
	menu selectItem: currentItem event: nil.
	^menu