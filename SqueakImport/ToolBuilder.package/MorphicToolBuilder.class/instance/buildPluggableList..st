widgets required
buildPluggableList: aSpec
	| widget listClass getIndex setIndex |
	aSpec getSelected ifNil:[
		listClass := self listClass.
		getIndex := aSpec getIndex.
		setIndex := aSpec setIndex.
	] ifNotNil:[
		listClass := self listByItemClass.
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
	
	widget
		dragItemSelector: aSpec dragItem;
		dropItemSelector: aSpec dropItem;
		wantsDropSelector: aSpec dropAccept;
		dragStartedSelector: aSpec dragStarted.

	self setListPropertiesFor: widget spec: aSpec.
	^widget