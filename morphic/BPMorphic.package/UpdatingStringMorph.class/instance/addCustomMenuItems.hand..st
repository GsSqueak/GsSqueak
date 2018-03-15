editing
addCustomMenuItems: menu hand: aHandMorph 
	| _gsSqueakTemp_prefix |
	super addCustomMenuItems: menu hand: aHandMorph.
	_gsSqueakTemp_prefix := (self growable
				ifTrue: ['stop being growable']
				ifFalse: ['start being growable']) translated.
	menu add: _gsSqueakTemp_prefix action: #toggleGrowability.
	menu add: 'decimal places...' translated action: #setPrecision.
	menu add: 'font size...' translated action: #setFontSize.
	menu add: 'font style...' translated action: #setFontStyle