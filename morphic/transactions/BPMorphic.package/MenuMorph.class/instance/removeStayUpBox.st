menu
removeStayUpBox
	| _gsSqueakTemp_box |
	submorphs isEmpty
		ifTrue: [^ self].
	submorphs first isAlignmentMorph
		ifFalse: [^ self].
	_gsSqueakTemp_box := submorphs first submorphs last.
	(_gsSqueakTemp_box isKindOf: IconicButton)
		ifTrue: [_gsSqueakTemp_box
				labelGraphic: (Form extent: _gsSqueakTemp_box extent depth: 8);
				 shedSelvedge;
				 borderWidth: 0;
				 lock]