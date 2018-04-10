menu
insertIntoMovie: evt 
	| _gsSqueakTemp_movies _gsSqueakTemp_aTarget |
	_gsSqueakTemp_movies := (self world rootMorphsAt: evt hand targetPoint)
				select: [:m | ((m isKindOf: MovieMorph)
							or: [m isSketchMorph])
						and: [m ~= self]].
	_gsSqueakTemp_movies isEmpty
		ifTrue: [^ self].
	_gsSqueakTemp_aTarget := _gsSqueakTemp_movies first.
	_gsSqueakTemp_aTarget isSketchMorph
		ifTrue: [_gsSqueakTemp_aTarget := _gsSqueakTemp_aTarget replaceSelfWithMovie].
	_gsSqueakTemp_aTarget
		insertFrames: (Array with: self).
	self delete