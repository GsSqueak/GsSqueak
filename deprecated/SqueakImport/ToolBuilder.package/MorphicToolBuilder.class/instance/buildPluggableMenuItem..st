widgets required
buildPluggableMenuItem: itemSpec
	| item action label menu |
	item := self menuItemClass new.
	label := (itemSpec isCheckable
		ifTrue: [	itemSpec checked ifTrue: ['<on>'] ifFalse: ['<off>']]
		ifFalse: ['']), itemSpec label.
	item contents: label.
	item isEnabled: itemSpec enabled.
	(action := itemSpec action) ifNotNil:[
		item 
			target: action receiver;
			selector: action selector;
			arguments: action arguments.
	].
	(menu := itemSpec subMenu) ifNotNil:[
		item subMenu: (menu buildWith: self).
	].
	parentMenu ifNotNil:[parentMenu addMorphBack: item].
	itemSpec separator ifTrue:[parentMenu addLine].
	^item