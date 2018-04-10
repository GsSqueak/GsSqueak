menu
setCurveBaseline: evt 
	| _gsSqueakTemp_handle _gsSqueakTemp_origin |
	_gsSqueakTemp_origin := evt cursorPoint.
	_gsSqueakTemp_handle := HandleMorph new
				forEachPointDo: [:newPoint | 
					_gsSqueakTemp_handle removeAllMorphs.
					_gsSqueakTemp_handle
						addMorph: (PolygonMorph
								vertices: (Array with: _gsSqueakTemp_origin with: newPoint)
								color: Color black
								borderWidth: 1
								borderColor: Color black).
					container baseline: (newPoint - _gsSqueakTemp_origin) y negated asInteger // 5.
					self paragraph composeAll].
	evt hand attachMorph: _gsSqueakTemp_handle.
	_gsSqueakTemp_handle startStepping