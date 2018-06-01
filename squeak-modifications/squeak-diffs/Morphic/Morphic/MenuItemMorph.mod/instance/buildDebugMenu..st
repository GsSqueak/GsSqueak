browse
buildDebugMenu: aHandMorph
	| aMenu |
	aMenu := super buildDebugMenu: aHandMorph.
	aMenu addLine.
	aMenu add: 'implementors of' translated target: self action: #browseAllImplementorsOfRealSelector.
	^ aMenu