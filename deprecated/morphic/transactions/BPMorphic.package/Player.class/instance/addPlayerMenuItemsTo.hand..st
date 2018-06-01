pen
addPlayerMenuItemsTo: aMenu hand: aHandMorph 
	"Note that these items are primarily available in another way in an
	object's Viewer"
	| _gsSqueakTemp_subMenu |
	_gsSqueakTemp_subMenu := MenuMorph new defaultTarget: self.
	self getPenDown
		ifTrue: [_gsSqueakTemp_subMenu add: 'lift pen' action: #liftPen]
		ifFalse: [_gsSqueakTemp_subMenu add: 'lower pen' action: #lowerPen].
	_gsSqueakTemp_subMenu add: 'choose pen size...' action: #choosePenSize.
	_gsSqueakTemp_subMenu add: 'choose pen color...' action: #choosePenColor:.
	aMenu add: 'pen...' subMenu: _gsSqueakTemp_subMenu.
	costume renderedMorph isSketchMorph
		ifTrue: [self belongsToUniClass
				ifTrue: [aMenu
						add: 'impart scripts to...'
						target: self
						action: #impartSketchScripts]
				ifFalse: [aMenu
						add: 'adopt scripts from...'
						target: self
						action: #adoptScriptsFrom]]