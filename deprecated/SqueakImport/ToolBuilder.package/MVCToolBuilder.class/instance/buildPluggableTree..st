widgets required
buildPluggableTree: aSpec
	"Fall-back to list view. Just show the roots."
	
	| widget listClass getIndex setIndex |
	listClass := PluggableListViewByItem.
	getIndex := aSpec getSelected.
	setIndex := aSpec setSelected.

	widget := PluggableListViewByItem on: aSpec model
				list: aSpec roots
				selected: aSpec getSelected
				changeSelected: aSpec setSelected
				menu: aSpec menu
				keystroke: aSpec keyPress.
	self register: widget id: aSpec name.
	self setFrame: aSpec frame in: widget.
	parent ifNotNil:[parent addSubView: widget].
	panes ifNotNil:[
		aSpec roots ifNotNil:[panes add: aSpec roots].
	].
	^widget