private
showDirectionHandles: wantToShow addHandles: needHandles 
	directionArrowAnchor := wantToShow
				ifTrue: [target referencePositionInWorld
					"not nil means show"].
	needHandles
		ifTrue: [self addHandles]