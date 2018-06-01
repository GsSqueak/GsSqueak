menu
setLabelFontTo: aFont
	"Change the receiver's label font to be as indicated"

	| aLabel oldLabel |
	aLabel := StringMorph contents:  (oldLabel := self findA: StringMorph) contents font: aFont.
	self replaceSubmorph: oldLabel by: aLabel.
	aLabel position: self position.
	aLabel highlightColor: self highlightColor; regularColor: self regularColor.
	aLabel lock.
	self fitContents.
	self layoutChanged.
	(owner isKindOf: IndexTabs) ifTrue:
		[self borderWidth: 0.
		owner laySubpartsOutInOneRow.
		isHighlighted ifTrue:
			[self highlight]]