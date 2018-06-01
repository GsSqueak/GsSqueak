private
doGrow: evt with: growHandle 
	"Called while the mouse is down in the grow handle"
	| _gsSqueakTemp_newExtent _gsSqueakTemp_extentToUse _gsSqueakTemp_scale |
	evt hand obtainHalo: self.
	_gsSqueakTemp_newExtent := (target
				pointFromWorld: (target griddedPoint: evt cursorPoint - positionOffset))
				- target topLeft.
	evt shiftPressed
		ifTrue: [_gsSqueakTemp_scale := _gsSqueakTemp_newExtent x
						/ (originalExtent x max: 1) min: _gsSqueakTemp_newExtent y
							/ (originalExtent y max: 1).
			_gsSqueakTemp_newExtent := (originalExtent x * _gsSqueakTemp_scale) asInteger @ (originalExtent y * _gsSqueakTemp_scale) asInteger].
	(_gsSqueakTemp_newExtent x < 1
			or: [_gsSqueakTemp_newExtent y < 1])
		ifTrue: [^ self].
	target renderedMorph setExtentFromHalo: (_gsSqueakTemp_extentToUse := _gsSqueakTemp_newExtent).
	growHandle position: evt cursorPoint - (growHandle extent // 2).
	self layoutChanged.
	(self valueOfProperty: #commandInProgress)
		ifNotNil: [:cmd | "Update the final extent"
			cmd
				redoTarget: target renderedMorph
				selector: #setFlexExtentFromHalo:
				argument: _gsSqueakTemp_extentToUse]