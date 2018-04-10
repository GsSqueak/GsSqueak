menu
changeEmphasis
	| _gsSqueakTemp_reply _gsSqueakTemp_aList |
	_gsSqueakTemp_aList := #(#normal #bold #italic #narrow #underlined #struckOut ).
	_gsSqueakTemp_reply := UIManager default
				chooseFrom: (_gsSqueakTemp_aList
						collect: [:t | t translated])
				values: _gsSqueakTemp_aList.
	_gsSqueakTemp_reply
		ifNotNil: [self emphasis: (TextEmphasis perform: _gsSqueakTemp_reply) emphasisCode]