primitives
primitiveAddBezierShape
	| _gsSqueakTemp_failureCode _gsSqueakTemp_points _gsSqueakTemp_lineFill _gsSqueakTemp_lineWidth _gsSqueakTemp_fillIndex _gsSqueakTemp_length _gsSqueakTemp_pointsIsArray _gsSqueakTemp_segSize _gsSqueakTemp_nSegments |
	"Fail if we have the wrong number of arguments"
	interpreterProxy methodArgumentCount = 5
		ifFalse: [^ interpreterProxy primitiveFailFor: PrimErrBadNumArgs].
	_gsSqueakTemp_lineFill := interpreterProxy
				positive32BitValueOf: (interpreterProxy stackValue: 0).
	_gsSqueakTemp_lineWidth := interpreterProxy stackIntegerValue: 1.
	_gsSqueakTemp_fillIndex := interpreterProxy
				positive32BitValueOf: (interpreterProxy stackValue: 2).
	_gsSqueakTemp_nSegments := interpreterProxy stackIntegerValue: 3.
	_gsSqueakTemp_points := interpreterProxy stackObjectValue: 4.
	interpreterProxy failed
		ifTrue: [^ interpreterProxy primitiveFailFor: PrimErrBadArgument].
	(_gsSqueakTemp_failureCode := self
					quickLoadEngineFrom: (interpreterProxy stackValue: 5)
					requiredState: GEStateUnlocked) = 0
		ifFalse: [^ interpreterProxy primitiveFailFor: _gsSqueakTemp_failureCode].
	"First, do a check if the points look okay"
	_gsSqueakTemp_length := interpreterProxy slotSizeOf: _gsSqueakTemp_points.
	(interpreterProxy isWords: _gsSqueakTemp_points)
		ifTrue: [_gsSqueakTemp_pointsIsArray := false.
			"Either PointArray or ShortPointArray"
			(_gsSqueakTemp_length = (_gsSqueakTemp_nSegments * 3)
					or: [_gsSqueakTemp_length = (_gsSqueakTemp_nSegments * 6)])
				ifFalse: [^ interpreterProxy primitiveFailFor: PrimErrBadArgument]]
		ifFalse: ["Must be Array of points"
			(interpreterProxy isArray: _gsSqueakTemp_points)
				ifFalse: [^ interpreterProxy primitiveFailFor: PrimErrBadArgument].
			_gsSqueakTemp_length = (_gsSqueakTemp_nSegments * 3)
				ifFalse: [^ interpreterProxy primitiveFailFor: PrimErrBadArgument].
			_gsSqueakTemp_pointsIsArray := true].
	"Now check that we have some hope to have enough free space.
	Do this by assuming nPoints boundaries of maximum size,
	hoping that most of the fills will be colors and many boundaries
	will be line segments"
	(_gsSqueakTemp_lineWidth = 0
			or: [_gsSqueakTemp_lineFill = 0])
		ifTrue: [_gsSqueakTemp_segSize := GLBaseSize]
		ifFalse: [_gsSqueakTemp_segSize := GLWideSize].
	(self needAvailableSpace: _gsSqueakTemp_segSize * _gsSqueakTemp_nSegments)
		ifFalse: [^ interpreterProxy primitiveFailFor: GEFWorkTooBig].
	"Check the fills"
	((self isFillOkay: _gsSqueakTemp_lineFill)
			and: [self isFillOkay: _gsSqueakTemp_fillIndex])
		ifFalse: [^ interpreterProxy primitiveFailFor: GEFWrongFill].
	"Transform colors"
	_gsSqueakTemp_lineFill := self transformColor: _gsSqueakTemp_lineFill.
	_gsSqueakTemp_fillIndex := self transformColor: _gsSqueakTemp_fillIndex.
	engineStopped
		ifTrue: [^ interpreterProxy primitiveFailFor: GEFEngineStopped].
	"Check if have anything at all to do"
	((_gsSqueakTemp_lineFill = 0
				or: [_gsSqueakTemp_lineWidth = 0])
			and: [_gsSqueakTemp_fillIndex = 0])
		ifTrue: [^ interpreterProxy pop: 5].
	"Transform the lineWidth"
	_gsSqueakTemp_lineWidth = 0
		ifFalse: [_gsSqueakTemp_lineWidth := self transformWidth: _gsSqueakTemp_lineWidth.
			_gsSqueakTemp_lineWidth < 1
				ifTrue: [_gsSqueakTemp_lineWidth := 1]].
	"And load the actual shape"
	_gsSqueakTemp_pointsIsArray
		ifTrue: [self
				loadArrayShape: _gsSqueakTemp_points
				nSegments: _gsSqueakTemp_nSegments
				fill: _gsSqueakTemp_fillIndex
				lineWidth: _gsSqueakTemp_lineWidth
				lineFill: _gsSqueakTemp_lineFill]
		ifFalse: [self
				loadShape: (interpreterProxy firstIndexableField: _gsSqueakTemp_points)
				nSegments: _gsSqueakTemp_nSegments
				fill: _gsSqueakTemp_fillIndex
				lineWidth: _gsSqueakTemp_lineWidth
				lineFill: _gsSqueakTemp_lineFill
				pointsShort: _gsSqueakTemp_nSegments * 3 = _gsSqueakTemp_length].
	engineStopped
		ifTrue: [^ interpreterProxy primitiveFailFor: GEFEngineStopped].
	interpreterProxy failed
		ifTrue: [^ interpreterProxy primitiveFailFor: GEFEntityLoadFailed].
	self needsFlushPut: 1.
	self storeEngineStateInto: engine.
	interpreterProxy pop: 5