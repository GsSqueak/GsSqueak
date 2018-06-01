widgets required
buildPluggableList: aSpec 
	| _gsSqueakTemp_widget _gsSqueakTemp_listClass _gsSqueakTemp_getIndex _gsSqueakTemp_setIndex |
	aSpec getSelected
		ifNil: [_gsSqueakTemp_listClass := self listClass.
			_gsSqueakTemp_getIndex := aSpec getIndex.
			_gsSqueakTemp_setIndex := aSpec setIndex]
		ifNotNil: [_gsSqueakTemp_listClass := self listByItemClass.
			_gsSqueakTemp_getIndex := aSpec getSelected.
			_gsSqueakTemp_setIndex := aSpec setSelected].
	_gsSqueakTemp_widget := _gsSqueakTemp_listClass
				on: aSpec model
				list: aSpec list
				selected: _gsSqueakTemp_getIndex
				changeSelected: _gsSqueakTemp_setIndex
				menu: aSpec menu
				keystroke: aSpec keyPress.
	self register: _gsSqueakTemp_widget id: aSpec name.
	_gsSqueakTemp_widget dragItemSelector: aSpec dragItem;
		 dropItemSelector: aSpec dropItem;
		 wantsDropSelector: aSpec dropAccept;
		 dragStartedSelector: aSpec dragStarted.
	self setListPropertiesFor: _gsSqueakTemp_widget spec: aSpec.
	^ _gsSqueakTemp_widget