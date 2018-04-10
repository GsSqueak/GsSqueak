widgets required
buildPluggableMenuItem: itemSpec 
	| _gsSqueakTemp_item _gsSqueakTemp_label |
	_gsSqueakTemp_item := self menuItemClass new.
	_gsSqueakTemp_label := (itemSpec isCheckable
				ifTrue: [itemSpec checked
						ifTrue: ['<on>']
						ifFalse: ['<off>']]
				ifFalse: [''])
				, itemSpec label.
	_gsSqueakTemp_item contents: _gsSqueakTemp_label.
	_gsSqueakTemp_item isEnabled: itemSpec enabled.
	itemSpec action
		ifNotNil: [:_gsSqueakTemp_action | _gsSqueakTemp_item target: _gsSqueakTemp_action receiver;
				 selector: _gsSqueakTemp_action selector;
				 arguments: _gsSqueakTemp_action arguments].
	itemSpec subMenu
		ifNotNil: [:_gsSqueakTemp_menu | _gsSqueakTemp_item
				subMenu: (_gsSqueakTemp_menu buildWith: self)].
	parentMenu
		ifNotNil: [parentMenu addMorphBack: _gsSqueakTemp_item].
	itemSpec separator
		ifTrue: [parentMenu addLine].
	^ _gsSqueakTemp_item