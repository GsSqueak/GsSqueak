widgets required
buildPluggableList: aSpec
	| widget listClass getIndex setIndex |
	aSpec getSelected ifNil:[
		listClass := PluggableListView.
		getIndex := aSpec getIndex.
		setIndex := aSpec setIndex.
	] ifNotNil:[
		listClass := PluggableListViewByItem.
		getIndex := aSpec getSelected.
		setIndex := aSpec setSelected.
	].
	widget := listClass on: aSpec model
				list: aSpec list
				selected: getIndex
				changeSelected: setIndex
				menu: aSpec menu
				keystroke: aSpec keyPress.
	self register: widget id: aSpec name.
	self setFrame: aSpec frame in: widget.
	parent ifNotNil:[parent addSubView: widget].
	panes ifNotNil:[
		aSpec list ifNotNil:[panes add: aSpec list].
	].
	^widget