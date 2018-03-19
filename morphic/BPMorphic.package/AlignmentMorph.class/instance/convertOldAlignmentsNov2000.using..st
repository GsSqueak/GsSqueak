object fileIn
convertOldAlignmentsNov2000: varDict using: smartRefStrm 
	"major change - much of AlignmentMorph is now implemented more
	generally in Morph"
	"These are going away 
	#('orientation' 'centering' 'hResizing' 'vResizing' 
	'inset' 'minCellSize' 'layoutNeeded' 'priorFullBounds')"
	| _gsSqueakTemp_orientation _gsSqueakTemp_centering _gsSqueakTemp_hResizing _gsSqueakTemp_vResizing _gsSqueakTemp_inset _gsSqueakTemp_minCellSize _gsSqueakTemp_inAlignment |
	_gsSqueakTemp_orientation := varDict at: 'orientation'.
	_gsSqueakTemp_centering := varDict at: 'centering'.
	_gsSqueakTemp_hResizing := varDict at: 'hResizing'.
	_gsSqueakTemp_vResizing := varDict at: 'vResizing'.
	_gsSqueakTemp_inset := varDict at: 'inset'.
	_gsSqueakTemp_minCellSize := varDict at: 'minCellSize'.
	(_gsSqueakTemp_orientation == #horizontal
			or: [_gsSqueakTemp_orientation == #vertical])
		ifTrue: [self layoutPolicy: TableLayout new].
	self cellPositioning: #topLeft.
	self rubberBandCells: true.
	_gsSqueakTemp_orientation == #horizontal
		ifTrue: [self listDirection: #leftToRight].
	_gsSqueakTemp_orientation == #vertical
		ifTrue: [self listDirection: #topToBottom].
	_gsSqueakTemp_centering == #topLeft
		ifTrue: [self wrapCentering: #topLeft].
	_gsSqueakTemp_centering == #bottomRight
		ifTrue: [self wrapCentering: #bottomRight].
	_gsSqueakTemp_centering == #center
		ifTrue: [self wrapCentering: #center.
			_gsSqueakTemp_orientation == #horizontal
				ifTrue: [self cellPositioning: #leftCenter]
				ifFalse: [self cellPositioning: #topCenter]].
	(_gsSqueakTemp_inset isNumber
			or: [_gsSqueakTemp_inset isPoint])
		ifTrue: [self layoutInset: _gsSqueakTemp_inset].
	(_gsSqueakTemp_minCellSize isNumber
			or: [_gsSqueakTemp_minCellSize isPoint])
		ifTrue: [self minCellSize: _gsSqueakTemp_minCellSize].
	(self hasProperty: #clipToOwnerWidth)
		ifTrue: [self clipSubmorphs: true].
	"now figure out if our owner was an AlignmentMorph, even if it is
	reshaped... "
	_gsSqueakTemp_inAlignment := false.
	owner isMorph
		ifTrue: [owner isAlignmentMorph
				ifTrue: [_gsSqueakTemp_inAlignment := true]]
		ifFalse: ["e.g., owner may be reshaped"
			(owner class instanceVariablesString findString: 'orientation centering hResizing vResizing')
					> 0
				ifTrue: ["this was an alignment morph being reshaped"
					_gsSqueakTemp_inAlignment := true]].
	"And check for containment in system windows"
	owner isSystemWindow
		ifTrue: [_gsSqueakTemp_inAlignment := true].
	(_gsSqueakTemp_hResizing == #spaceFill
			and: [_gsSqueakTemp_inAlignment not])
		ifTrue: [self hResizing: #shrinkWrap]
		ifFalse: [self hResizing: _gsSqueakTemp_hResizing].
	(_gsSqueakTemp_vResizing == #spaceFill
			and: [_gsSqueakTemp_inAlignment not])
		ifTrue: [self vResizing: #shrinkWrap]
		ifFalse: [self vResizing: _gsSqueakTemp_vResizing]