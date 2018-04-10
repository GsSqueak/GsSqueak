colors
paneColor
	| _gsSqueakTemp_cc |
	(_gsSqueakTemp_cc := self valueOfProperty: #paneColor)
		ifNotNil: [^ _gsSqueakTemp_cc].
	(model respondsTo: #windowColorToUse)
		ifTrue: [_gsSqueakTemp_cc := model windowColorToUse].
	_gsSqueakTemp_cc
		ifNil: [_gsSqueakTemp_cc := paneMorphs isEmptyOrNil
						ifFalse: [paneMorphs first color]].
	_gsSqueakTemp_cc
		ifNil: [_gsSqueakTemp_cc := self defaultColor].
	self paneColor: _gsSqueakTemp_cc.
	^ _gsSqueakTemp_cc