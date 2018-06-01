shared flaps
positionVisibleFlapsRightToLeftOnEdge: edgeSymbol butPlaceAtLeftFlapsWithIDs: idList 
	"Lay out flaps along the designated edge right-to-left, while laying
	left-to-right any flaps found in the exception list
	
	Flaps positionVisibleFlapsRightToLeftOnEdge: #bottom
	butPlaceAtLeftFlapWithIDs: {'Navigator' translated. 'Supplies'
	translated} Flaps sharedFlapsAlongBottom"
	| _gsSqueakTemp_leftX _gsSqueakTemp_flapList _gsSqueakTemp_flapsOnRight _gsSqueakTemp_flapsOnLeft |
	_gsSqueakTemp_flapList := self globalFlapTabsIfAny
				select: [:aFlapTab | aFlapTab isInWorld
						and: [aFlapTab edgeToAdhereTo == edgeSymbol]].
	_gsSqueakTemp_flapsOnLeft := _gsSqueakTemp_flapList
				select: [:fl | idList includes: fl flapID].
	_gsSqueakTemp_flapList removeAll: _gsSqueakTemp_flapsOnLeft.
	_gsSqueakTemp_flapsOnRight := _gsSqueakTemp_flapList
				asSortedCollection: [:f1 :f2 | f1 left > f2 left].
	_gsSqueakTemp_leftX := (Smalltalk at: #ActiveWorld) width - 15.
	_gsSqueakTemp_flapsOnRight
		do: [:aFlapTab | 
			aFlapTab right: _gsSqueakTemp_leftX - 3.
			_gsSqueakTemp_leftX := aFlapTab left].
	_gsSqueakTemp_leftX := (Smalltalk at: #ActiveWorld) left.
	_gsSqueakTemp_flapsOnLeft := _gsSqueakTemp_flapsOnLeft
				asSortedCollection: [:f1 :f2 | f1 left > f2 left].
	_gsSqueakTemp_flapsOnLeft
		do: [:aFlapTab | 
			aFlapTab left: _gsSqueakTemp_leftX + 3.
			_gsSqueakTemp_leftX := aFlapTab right].
	_gsSqueakTemp_flapsOnLeft asOrderedCollection , _gsSqueakTemp_flapsOnRight asOrderedCollection
		do: [:ft | 
			ft computeEdgeFraction.
			ft flapID = 'Navigator' translated
				ifTrue: [ft referent
						left: (ft center x - (ft referent width // 2) max: 0)]]