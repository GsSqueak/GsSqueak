widgets optional
buildPluggableAlternateMultiSelectionList: aSpec 
	| _gsSqueakTemp_listMorph _gsSqueakTemp_listClass |
	aSpec getSelected
		ifNotNil: [^ self error: 'There is no PluggableAlternateListMorphOfManyByItem'].
	_gsSqueakTemp_listClass := self alternateMultiSelectListClass.
	_gsSqueakTemp_listMorph := _gsSqueakTemp_listClass
				on: aSpec model
				list: aSpec list
				primarySelection: aSpec getIndex
				changePrimarySelection: aSpec setIndex
				listSelection: aSpec getSelectionList
				changeListSelection: aSpec setSelectionList
				menu: aSpec menu.
	_gsSqueakTemp_listMorph setProperty: #highlightSelector toValue: #highlightMessageList:with:;
		 setProperty: #itemConversionMethod toValue: #asStringOrText;
		 setProperty: #balloonTextSelectorForSubMorphs toValue: #balloonTextForClassAndMethodString;
		 enableDragNDrop: SystemBrowser browseWithDragNDrop;
		 menuTitleSelector: #messageListSelectorTitle.
	self register: _gsSqueakTemp_listMorph id: aSpec name.
	_gsSqueakTemp_listMorph keystrokeActionSelector: aSpec keyPress;
		 getListElementSelector: aSpec listItem;
		 getListSizeSelector: aSpec listSize;
		 getIconSelector: aSpec icon;
		 getHelpSelector: aSpec helpItem.
	self buildHelpFor: _gsSqueakTemp_listMorph spec: aSpec.
	self setFrame: aSpec frame in: _gsSqueakTemp_listMorph.
	self setLayoutHintsFor: _gsSqueakTemp_listMorph spec: aSpec.
	parent
		ifNotNil: [self add: _gsSqueakTemp_listMorph to: parent].
	panes
		ifNotNil: [aSpec list
				ifNotNil: [panes add: aSpec list]].
	^ _gsSqueakTemp_listMorph