model access
copyright
	| _gsSqueakTemp_f |
	_gsSqueakTemp_f := self selectedFont
				ifNil: [^ ''].
	^ _gsSqueakTemp_f isTTCFont
		ifTrue: [_gsSqueakTemp_f ttcDescription copyright
				ifNil: ['']]
		ifFalse: ['']