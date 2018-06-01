menu
changeTabText
	| _gsSqueakTemp_reply |
	_gsSqueakTemp_reply := UIManager default request: 'new wording for this tab:' initialAnswer: submorphs first contents.
	_gsSqueakTemp_reply isEmptyOrNil
		ifFalse: [submorphs first contents: _gsSqueakTemp_reply]