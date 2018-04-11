textual tabs
useStringTab: aString 
	| _gsSqueakTemp_aLabel |
	labelString := aString asString.
	_gsSqueakTemp_aLabel := StringMorph new contents: labelString.
	self addMorph: _gsSqueakTemp_aLabel.
	_gsSqueakTemp_aLabel position: self position.
	_gsSqueakTemp_aLabel highlightColor: self highlightColor;
		 regularColor: self regularColor.
	_gsSqueakTemp_aLabel lock.
	self fitContents.
	self layoutChanged