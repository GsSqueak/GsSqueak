edge
setEdgeToAdhereTo
	| aMenu |
	aMenu := MenuMorph new defaultTarget: self.
	#(left top right bottom) do:
		[:sym | aMenu add: sym asString translated target: self selector:  #setEdge: argument: sym].
	aMenu popUpEvent: self currentEvent in: self world