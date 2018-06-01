widgets optional
buildPluggableMultiSelectionList: aSpec 
	| _gsSqueakTemp_widget _gsSqueakTemp_listClass |
	aSpec getSelected
		ifNotNil: [^ self error: 'There is no PluggableListMorphOfManyByItem'].
	_gsSqueakTemp_listClass := self multiSelectListClass.
	_gsSqueakTemp_widget := _gsSqueakTemp_listClass
				on: aSpec model
				list: aSpec list
				primarySelection: aSpec getIndex
				changePrimarySelection: aSpec setIndex
				listSelection: aSpec getSelectionList
				changeListSelection: aSpec setSelectionList
				menu: aSpec menu.
	_gsSqueakTemp_widget keystrokeActionSelector: aSpec keyPress.
	self register: _gsSqueakTemp_widget id: aSpec name.
	self setListPropertiesFor: _gsSqueakTemp_widget spec: aSpec.
	^ _gsSqueakTemp_widget