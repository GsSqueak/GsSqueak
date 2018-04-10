edge
setEdgeToAdhereTo
	| _gsSqueakTemp_aMenu |
	_gsSqueakTemp_aMenu := MenuMorph new defaultTarget: self.
	#(#left #top #right #bottom)
		do: [:sym | _gsSqueakTemp_aMenu
				add: sym asString translated
				target: self
				selector: #setEdge:
				argument: sym].
	_gsSqueakTemp_aMenu popUpEvent: self currentEvent in: self world