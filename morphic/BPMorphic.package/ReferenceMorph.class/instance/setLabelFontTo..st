menu
setLabelFontTo: aFont 
	"Change the receiver's label font to be as indicated"
	| _gsSqueakTemp_aLabel _gsSqueakTemp_oldLabel |
	_gsSqueakTemp_aLabel := StringMorph contents: (_gsSqueakTemp_oldLabel := self findA: StringMorph) contents font: aFont.
	self replaceSubmorph: _gsSqueakTemp_oldLabel by: _gsSqueakTemp_aLabel.
	_gsSqueakTemp_aLabel position: self position.
	_gsSqueakTemp_aLabel highlightColor: self highlightColor;
		 regularColor: self regularColor.
	_gsSqueakTemp_aLabel lock.
	self fitContents.
	self layoutChanged.
	(owner isKindOf: IndexTabs)
		ifTrue: [self borderWidth: 0.
			owner laySubpartsOutInOneRow.
			isHighlighted
				ifTrue: [self highlight]]