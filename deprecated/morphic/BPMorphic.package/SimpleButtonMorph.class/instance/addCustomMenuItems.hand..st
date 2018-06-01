menu
addCustomMenuItems: aCustomMenu hand: aHandMorph 
	super addCustomMenuItems: aCustomMenu hand: aHandMorph.
	self addLabelItemsTo: aCustomMenu hand: aHandMorph.
	(target isKindOf: BookMorph)
		ifTrue: [aCustomMenu add: 'set page sound' translated action: #setPageSound:.
			aCustomMenu add: 'set page visual' translated action: #setPageVisual:]
		ifFalse: [aCustomMenu add: 'change action selector' translated action: #setActionSelector.
			aCustomMenu add: 'change arguments' translated action: #setArguments.
			aCustomMenu add: 'change when to act' translated action: #setActWhen.
			self addTargetingMenuItems: aCustomMenu hand: aHandMorph]