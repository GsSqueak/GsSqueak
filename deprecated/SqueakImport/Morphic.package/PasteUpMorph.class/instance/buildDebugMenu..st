menu & halo
buildDebugMenu: aHandMorph
	| aMenu |
	aMenu := super buildDebugMenu: aHandMorph.
	aMenu add:  'abandon costume history' translated target: self action: #abandonCostumeHistory.
	^ aMenu