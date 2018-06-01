widgets optional
buildPluggableMultiSelectionList: aSpec
	| widget listClass |
	aSpec getSelected ifNotNil:[^self error:'There is no PluggableListMorphOfManyByItem'].
	listClass := self multiSelectListClass.
	widget := listClass on: aSpec model
		list: aSpec list
		primarySelection: aSpec getIndex
		changePrimarySelection: aSpec setIndex
		listSelection: aSpec getSelectionList
		changeListSelection: aSpec setSelectionList
		menu: aSpec menu.
	widget keystrokeActionSelector: aSpec keyPress.
	self register: widget id: aSpec name.
	self setListPropertiesFor: widget spec: aSpec.
	^widget