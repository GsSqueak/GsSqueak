object fileIn
convertOldAlignmentsNov2000: varDict using: smartRefStrm 
	"major change - much of AlignmentMorph is now implemented more generally in Morph"

	"These are going away 
	#('orientation' 'centering' 'hResizing' 'vResizing' 
	'inset' 'minCellSize' 'layoutNeeded' 'priorFullBounds')"

	| orientation centering hResizing vResizing inset minCellSize inAlignment |
	orientation := varDict at: 'orientation'.
	centering := varDict at: 'centering'.
	hResizing := varDict at: 'hResizing'.
	vResizing := varDict at: 'vResizing'.
	inset := varDict at: 'inset'.
	minCellSize := varDict at: 'minCellSize'.
	(orientation == #horizontal or: [orientation == #vertical]) 
		ifTrue: [self layoutPolicy: TableLayout new].
	self cellPositioning: #topLeft.
	self rubberBandCells: true.
	orientation == #horizontal ifTrue: [self listDirection: #leftToRight].
	orientation == #vertical ifTrue: [self listDirection: #topToBottom].
	centering == #topLeft ifTrue: [self wrapCentering: #topLeft].
	centering == #bottomRight ifTrue: [self wrapCentering: #bottomRight].
	centering == #center 
		ifTrue: 
			[self wrapCentering: #center.
			orientation == #horizontal 
				ifTrue: [self cellPositioning: #leftCenter]
				ifFalse: [self cellPositioning: #topCenter]].
	(inset isNumber or: [inset isPoint]) ifTrue: [self layoutInset: inset].
	(minCellSize isNumber or: [minCellSize isPoint]) 
		ifTrue: [self minCellSize: minCellSize].
	(self hasProperty: #clipToOwnerWidth) ifTrue: [self clipSubmorphs: true].

	"now figure out if our owner was an AlignmentMorph, even if it is reshaped..."
	inAlignment := false.
	owner isMorph 
		ifTrue: [(owner isAlignmentMorph) ifTrue: [inAlignment := true]]
		ifFalse: 
			["e.g., owner may be reshaped"

			(owner class instanceVariablesString 
				findString: 'orientation centering hResizing vResizing') > 0 
				ifTrue: 
					["this was an alignment morph being reshaped"

					inAlignment := true]].
	"And check for containment in system windows"
	owner isSystemWindow ifTrue: [inAlignment := true].
	(hResizing == #spaceFill and: [inAlignment not]) 
		ifTrue: [self hResizing: #shrinkWrap]
		ifFalse: [self hResizing: hResizing].
	(vResizing == #spaceFill and: [inAlignment not]) 
		ifTrue: [self vResizing: #shrinkWrap]
		ifFalse: [self vResizing: vResizing]