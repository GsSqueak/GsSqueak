resize/collapse
reframePanesAdjoining: growingPane along: side to: aDisplayBox 
	| _gsSqueakTemp_delta _gsSqueakTemp_newRect _gsSqueakTemp_minDim _gsSqueakTemp_theMin _gsSqueakTemp_horiz |
	growingPane
		ifNil: [^ self].
	"As from click outside"
	_gsSqueakTemp_newRect := aDisplayBox.
	_gsSqueakTemp_horiz := #(#left #right ) includes: side.
	_gsSqueakTemp_theMin := _gsSqueakTemp_horiz
				ifTrue: [40]
				ifFalse: [20].
	"First check that this won't make any pane smaller than theMin screen
	dots "
	_gsSqueakTemp_minDim := (((paneMorphs
				select: [:pane | pane bounds bordersOn: growingPane bounds along: side])
				collect: [:pane | pane bounds adjustTo: _gsSqueakTemp_newRect along: side])
				copyWith: aDisplayBox)
				inject: 999
				into: [:was :rect | was
						min: (_gsSqueakTemp_horiz
								ifTrue: [rect width]
								ifFalse: [rect height])].
	"If so, amend newRect as required"
	_gsSqueakTemp_minDim > _gsSqueakTemp_theMin
		ifFalse: [_gsSqueakTemp_delta := _gsSqueakTemp_minDim - _gsSqueakTemp_theMin.
			_gsSqueakTemp_newRect := _gsSqueakTemp_newRect
						withSide: side
						setTo: ((_gsSqueakTemp_newRect perform: side)
									> (growingPane bounds perform: side)
								ifTrue: [(_gsSqueakTemp_newRect perform: side)
										+ _gsSqueakTemp_delta]
								ifFalse: [(_gsSqueakTemp_newRect perform: side)
										- _gsSqueakTemp_delta])].
	"Now adjust all adjoining panes for real"
	paneMorphs
		do: [:pane | (pane bounds bordersOn: growingPane bounds along: side)
				ifTrue: [pane
						bounds: (pane bounds adjustTo: _gsSqueakTemp_newRect along: side)]].
	"And adjust the growing pane itself"
	growingPane bounds: _gsSqueakTemp_newRect.
	"Finally force a recomposition of the whole window"
	self setPaneRectsFromBounds.
	self extent: self extent