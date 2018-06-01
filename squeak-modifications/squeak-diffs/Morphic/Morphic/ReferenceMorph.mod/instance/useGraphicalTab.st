menu
useGraphicalTab
	| aGraphic |
	self preserveDetails.
	self color: Color transparent.
	aGraphic := self graphicalMorphForTab.
	self borderWidth: 0.
	self removeAllMorphs.
	self addMorphBack: aGraphic.
	aGraphic position: self position.
	aGraphic lock.
	self fitContents.
	self layoutChanged.
	(owner isKindOf: IndexTabs) ifTrue:
		[owner laySubpartsOutInOneRow.
		isHighlighted ifTrue: [self highlight]].