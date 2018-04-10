menu
useTextualTab
	"Use a textually-emblazoned tab"
	| _gsSqueakTemp_aLabel _gsSqueakTemp_stringToUse _gsSqueakTemp_font _gsSqueakTemp_aColor |
	self preserveDetails.
	_gsSqueakTemp_stringToUse := self
				valueOfProperty: #priorWording
				ifAbsent: [self externalName].
	_gsSqueakTemp_font := self
				valueOfProperty: #priorFont
				ifAbsent: [Preferences standardButtonFont].
	_gsSqueakTemp_aColor := self
				valueOfProperty: #priorColor
				ifAbsent: [Color green darker].
	_gsSqueakTemp_aLabel := StringMorph contents: _gsSqueakTemp_stringToUse font: _gsSqueakTemp_font.
	self replaceSubmorph: submorphs first by: _gsSqueakTemp_aLabel.
	_gsSqueakTemp_aLabel position: self position.
	self color: _gsSqueakTemp_aColor.
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