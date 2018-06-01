panes
updateBoxesColor: aColor 
	| _gsSqueakTemp_opaqueColor |
	aColor isNil
		ifTrue: [^ self].
	Preferences alternativeWindowBoxesLook
		ifFalse: [^ self].
	_gsSqueakTemp_opaqueColor := aColor asNontranslucentColor.
	self
		updateBox: closeBox
		color: (_gsSqueakTemp_opaqueColor alphaMixed: 0.5 with: Color red).
	self updateBox: menuBox color: _gsSqueakTemp_opaqueColor.
	self updateBox: expandBox color: _gsSqueakTemp_opaqueColor.
	self updateBox: collapseBox color: _gsSqueakTemp_opaqueColor