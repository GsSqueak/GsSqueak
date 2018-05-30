private
effect: effectSymbol direction: dirSymbol 
	| i |
	effect := effectSymbol.

	"Default directions"
	(#(#zoom #zoomFrame #frenchDoor) includes: effectSymbol) 
		ifTrue: 
			[direction := (#(#in #out #inH #outH) includes: dirSymbol) 
				ifTrue: [dirSymbol]
				ifFalse: [#in]]
		ifFalse: 
			[i := #(#right #downRight #down #downLeft #left #upLeft #up #upRight) 
						indexOf: dirSymbol
						ifAbsent: [5].
			direction := (0 @ 0) eightNeighbors at: i]