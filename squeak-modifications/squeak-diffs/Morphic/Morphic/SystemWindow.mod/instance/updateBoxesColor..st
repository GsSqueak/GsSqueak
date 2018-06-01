panes
updateBoxesColor: aColor 
	| opaqueColor |
	aColor isNil
		ifTrue: [^ self].
	Preferences alternativeWindowBoxesLook ifFalse:[^ self].
	
	opaqueColor := aColor asNontranslucentColor.
	
	self
		updateBox: closeBox
		color: (opaqueColor alphaMixed: 0.5 with: Color red).
	self updateBox: menuBox color: opaqueColor.
	self updateBox: expandBox color: opaqueColor.
	self updateBox: collapseBox color: opaqueColor