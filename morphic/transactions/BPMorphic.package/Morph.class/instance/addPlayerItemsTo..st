-Etoys
addPlayerItemsTo: aMenu 
	"Add player-related items to the menu if appropriate"
	| _gsSqueakTemp_aPlayer _gsSqueakTemp_subMenu |
	self couldMakeSibling
		ifFalse: [^ self].
	_gsSqueakTemp_aPlayer := self topRendererOrSelf player.
	_gsSqueakTemp_subMenu := MenuMorph new defaultTarget: self.
	_gsSqueakTemp_subMenu
		add: 'make a sibling instance' translated
		target: self
		action: #makeNewPlayerInstance:.
	_gsSqueakTemp_subMenu balloonTextForLastItem: 'Makes another morph whose player is of the same class as this one.  Both siblings will share the same scripts' translated.
	_gsSqueakTemp_subMenu
		add: 'make multiple siblings...' translated
		target: self
		action: #makeMultipleSiblings:.
	_gsSqueakTemp_subMenu balloonTextForLastItem: 'Make any number of sibling instances all at once' translated.
	(_gsSqueakTemp_aPlayer belongsToUniClass
			and: [_gsSqueakTemp_aPlayer class instanceCount > 1])
		ifTrue: [_gsSqueakTemp_subMenu addLine.
			_gsSqueakTemp_subMenu
				add: 'make all siblings look like me' translated
				target: self
				action: #makeSiblingsLookLikeMe:.
			_gsSqueakTemp_subMenu balloonTextForLastItem: 'make all my sibling instances look like me.' translated.
			_gsSqueakTemp_subMenu
				add: 'bring all siblings to my location' translated
				target: self
				action: #bringAllSiblingsToMe:.
			_gsSqueakTemp_subMenu balloonTextForLastItem: 'find all sibling instances and bring them to me' translated.
			_gsSqueakTemp_subMenu
				add: 'apply status to all siblngs' translated
				target: self
				action: #applyStatusToAllSiblings:.
			_gsSqueakTemp_subMenu balloonTextForLastItem: 'apply the current status of all of my scripts to the scripts of all my siblings' translated].
	_gsSqueakTemp_subMenu
		add: 'indicate all siblings' translated
		target: self
		action: #indicateAllSiblings.
	_gsSqueakTemp_subMenu balloonTextForLastItem: 'momentarily show, by flashing , all of my visible siblings.'.
	aMenu add: 'siblings...' translated subMenu: _gsSqueakTemp_subMenu