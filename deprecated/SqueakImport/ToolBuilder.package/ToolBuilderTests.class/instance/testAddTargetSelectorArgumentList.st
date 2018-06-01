tests-menus
testAddTargetSelectorArgumentList
	self assertItemFiresWith: 
		[:spec | spec
				add: 'Menu Item' 
				target: self
				selector: #fireMenuAction
				argumentList: #()]