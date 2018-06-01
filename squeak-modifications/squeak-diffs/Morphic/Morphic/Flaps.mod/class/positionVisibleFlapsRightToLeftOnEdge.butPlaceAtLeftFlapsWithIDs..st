shared flaps
positionVisibleFlapsRightToLeftOnEdge: edgeSymbol butPlaceAtLeftFlapsWithIDs: idList
	"Lay out flaps along the designated edge right-to-left, while laying left-to-right any flaps found in the exception list

	Flaps positionVisibleFlapsRightToLeftOnEdge: #bottom butPlaceAtLeftFlapWithIDs: {'Navigator' translated. 'Supplies' translated}
	Flaps sharedFlapsAlongBottom"

	| leftX flapList flapsOnRight flapsOnLeft |
	flapList := self globalFlapTabsIfAny select:
		[:aFlapTab | aFlapTab isInWorld and: [aFlapTab edgeToAdhereTo == edgeSymbol]].
	flapsOnLeft := OrderedCollection new.
	flapsOnRight := OrderedCollection new.
	
	flapList do: [:fl | 
		(idList includes: fl flapID)
			ifTrue: [ flapsOnLeft addLast: fl ]
			ifFalse: [ flapsOnRight addLast: fl ] ].

	leftX := ActiveWorld width - 15.

	flapsOnRight 
		sort: [:f1 :f2 | f1 left > f2 left];
		do: [:aFlapTab |
			aFlapTab right: leftX - 3.
			leftX := aFlapTab left].

	leftX := ActiveWorld left.

	flapsOnLeft
		sort: [:f1 :f2 | f1 left > f2 left];
		do: [:aFlapTab |
			aFlapTab left: leftX + 3.
			leftX := aFlapTab right].

	flapList do:
		[:ft | ft computeEdgeFraction.
		ft flapID = 'Navigator' translated ifTrue:
			[ft referent left: (ft center x - (ft referent width//2) max: 0)]]