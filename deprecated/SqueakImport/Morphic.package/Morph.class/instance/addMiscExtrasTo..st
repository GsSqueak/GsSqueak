menus
addMiscExtrasTo: aMenu
	"Add a submenu of miscellaneous extra items to the menu."

	| realOwner realMorph subMenu |
	subMenu := MenuMorph new defaultTarget: self.
	(self isWorldMorph not and: [(self renderedMorph isSystemWindow) not])
		ifTrue: [subMenu add: 'put in a window' translated action: #embedInWindow].

	self isWorldMorph ifFalse:
		[subMenu add: 'adhere to edge...' translated action: #adhereToEdge.
		subMenu addLine].

	realOwner := (realMorph := self topRendererOrSelf) owner.
	(realOwner isKindOf: TextPlusPasteUpMorph) ifTrue:
		[subMenu add: 'GeeMail stuff...' translated subMenu: (realOwner textPlusMenuFor: realMorph)].

	subMenu
		add: 'add mouse up action' translated action: #addMouseUpAction;
		add: 'remove mouse up action' translated action: #removeMouseUpAction;
		add: 'hand me tiles to fire this button' translated action: #handMeTilesToFire.
	subMenu addLine.
	subMenu add: 'arrowheads on pen trails...' translated action: #setArrowheads.
	subMenu addLine.

	subMenu defaultTarget: self topRendererOrSelf.
	subMenu add: 'draw new path' translated action: #definePath.
	subMenu add: 'follow existing path' translated action: #followPath.
	subMenu add: 'delete existing path' translated action: #deletePath.
	subMenu addLine.

	self addGestureMenuItems: subMenu hand: ActiveHand.

	aMenu add: 'extras...' translated subMenu: subMenu