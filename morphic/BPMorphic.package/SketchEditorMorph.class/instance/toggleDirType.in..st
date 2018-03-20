actions & preps
toggleDirType: evt in: handle 
	"Toggle from 'rotate' to 'to and fro' to 'up and down' to 'none'
	for the kind of rotation the object does. An actor's rotationStyle is one
	of #(normal leftRight upDown none)."
	"Clear the indicator"
	"Find new style, store it, install the indicator"
	| _gsSqueakTemp_rr _gsSqueakTemp_ii |
	_gsSqueakTemp_rr := self rotationStyle.
	_gsSqueakTemp_ii := #(#normal #leftRight #upDown #none) indexOf: _gsSqueakTemp_rr.
	self
		setProperty: #rotationStyle
		toValue: (#(#leftRight #upDown #none #normal) at: _gsSqueakTemp_ii).
	_gsSqueakTemp_ii = 4
		ifTrue: ["normal"
			self
				forward: self forwardDirection
				direction: (self valueOfProperty: #fwdButton)]
		ifFalse: [self showDirType]