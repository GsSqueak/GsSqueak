events
toggleExpandedState: aMorph event: event 
	"self setSelectedMorph: aMorph."
	| _gsSqueakTemp_oldState |
	event yellowButtonPressed
		ifTrue: [_gsSqueakTemp_oldState := aMorph isExpanded.
			scroller submorphs copy
				do: [:each | (each canExpand
							and: [each isExpanded = _gsSqueakTemp_oldState])
						ifTrue: [each toggleExpandedState]]]
		ifFalse: [aMorph toggleExpandedState].
	self adjustSubmorphPositions