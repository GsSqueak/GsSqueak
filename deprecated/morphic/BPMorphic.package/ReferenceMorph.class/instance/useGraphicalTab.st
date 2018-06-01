menu
useGraphicalTab
	| _gsSqueakTemp_aGraphic |
	self preserveDetails.
	self color: Color transparent.
	_gsSqueakTemp_aGraphic := self graphicalMorphForTab.
	self borderWidth: 0.
	self removeAllMorphs.
	self addMorphBack: _gsSqueakTemp_aGraphic.
	_gsSqueakTemp_aGraphic position: self position.
	_gsSqueakTemp_aGraphic lock.
	self fitContents.
	self layoutChanged.
	(owner isKindOf: IndexTabs)
		ifTrue: [owner laySubpartsOutInOneRow.
			isHighlighted
				ifTrue: [self highlight]]