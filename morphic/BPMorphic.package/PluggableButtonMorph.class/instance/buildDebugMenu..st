browse
buildDebugMenu: aHandMorph 
	| _gsSqueakTemp_aMenu |
	_gsSqueakTemp_aMenu := super buildDebugMenu: aHandMorph.
	_gsSqueakTemp_aMenu addLine.
	_gsSqueakTemp_aMenu
		add: 'implementors of' translated
		target: self
		action: #browseAllImplementorsOfActionSelector.
	^ _gsSqueakTemp_aMenu