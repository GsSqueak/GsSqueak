-Etoys-support
listViewLineForFieldList: aFieldList 
	"Answer a ListLineView object which describes the receiver"
	| _gsSqueakTemp_aLine |
	_gsSqueakTemp_aLine := ListViewLine new objectRepresented: self.
	aFieldList
		do: [:fieldSym | 
			_gsSqueakTemp_aLine
				addMorphBack: (self readoutForField: fieldSym).
			_gsSqueakTemp_aLine addTransparentSpacerOfSize: 7 @ 0].
	^ _gsSqueakTemp_aLine