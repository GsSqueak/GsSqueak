widgets optional
buildPluggableAlternateMultiSelectionList: aSpec
	| listMorph listClass |
	aSpec getSelected ifNotNil: [ ^ self error: 'There is no PluggableAlternateListMorphOfManyByItem' ].
	listClass := self alternateMultiSelectListClass.
	listMorph := listClass 
		on: aSpec model
		list: aSpec list
		primarySelection: aSpec getIndex
		changePrimarySelection: aSpec setIndex
		listSelection: aSpec getSelectionList
		changeListSelection: aSpec setSelectionList
		menu: aSpec menu.
	listMorph
		setProperty: #highlightSelector toValue: #highlightMessageList:with: ;
		setProperty: #itemConversionMethod toValue: #asStringOrText ;
		setProperty: #balloonTextSelectorForSubMorphs toValue: #balloonTextForClassAndMethodString ;
		enableDragNDrop: SystemBrowser browseWithDragNDrop ;
		menuTitleSelector: #messageListSelectorTitle.
	self 
		register: listMorph
		id: aSpec name.
	listMorph
		keystrokeActionSelector: aSpec keyPress ;
		getListElementSelector: aSpec listItem ;
		getListSizeSelector: aSpec listSize;
		getIconSelector: aSpec icon;
		getHelpSelector: aSpec helpItem.
		
	self buildHelpFor: listMorph spec: aSpec.
		
	self 
		setFrame: aSpec frame 
		in: listMorph.
	self setLayoutHintsFor: listMorph spec: aSpec.
	parent ifNotNil: [ self add: listMorph to: parent ].
	panes ifNotNil: [ aSpec list ifNotNil:[panes add: aSpec list ] ].
	^ listMorph