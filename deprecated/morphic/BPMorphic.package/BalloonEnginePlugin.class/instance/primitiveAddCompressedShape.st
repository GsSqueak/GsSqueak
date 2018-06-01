primitives
primitiveAddCompressedShape
	| _gsSqueakTemp_failureCode _gsSqueakTemp_fillIndexList _gsSqueakTemp_lineFills _gsSqueakTemp_lineWidths _gsSqueakTemp_rightFills _gsSqueakTemp_leftFills _gsSqueakTemp_nSegments _gsSqueakTemp_points _gsSqueakTemp_pointsShort |
	"Fail if we have the wrong number of arguments"
	interpreterProxy methodArgumentCount = 7
		ifFalse: [^ interpreterProxy primitiveFailFor: PrimErrBadNumArgs].
	_gsSqueakTemp_fillIndexList := interpreterProxy stackObjectValue: 0.
	_gsSqueakTemp_lineFills := interpreterProxy stackObjectValue: 1.
	_gsSqueakTemp_lineWidths := interpreterProxy stackObjectValue: 2.
	_gsSqueakTemp_rightFills := interpreterProxy stackObjectValue: 3.
	_gsSqueakTemp_leftFills := interpreterProxy stackObjectValue: 4.
	_gsSqueakTemp_nSegments := interpreterProxy stackIntegerValue: 5.
	_gsSqueakTemp_points := interpreterProxy stackObjectValue: 6.
	interpreterProxy failed
		ifTrue: [^ interpreterProxy primitiveFailFor: PrimErrBadArgument].
	(_gsSqueakTemp_failureCode := self
					quickLoadEngineFrom: (interpreterProxy stackValue: 7)
					requiredState: GEStateUnlocked) = 0
		ifFalse: [^ interpreterProxy primitiveFailFor: _gsSqueakTemp_failureCode].
	"First, do a check if the compressed shape is okay"
	(self
			checkCompressedShape: _gsSqueakTemp_points
			segments: _gsSqueakTemp_nSegments
			leftFills: _gsSqueakTemp_leftFills
			rightFills: _gsSqueakTemp_rightFills
			lineWidths: _gsSqueakTemp_lineWidths
			lineFills: _gsSqueakTemp_lineFills
			fillIndexList: _gsSqueakTemp_fillIndexList)
		ifFalse: [^ interpreterProxy primitiveFailFor: GEFEntityCheckFailed].
	"Now check that we have some hope to have enough free space.
	Do this by assuming nSegments boundaries of maximum size,
	hoping that most of the fills will be colors and many boundaries
	will be line segments"
	(self needAvailableSpace: (GBBaseSize max: GLBaseSize)
				* _gsSqueakTemp_nSegments)
		ifFalse: [^ interpreterProxy primitiveFailFor: GEFWorkTooBig].
	"Check if the points are short"
	_gsSqueakTemp_pointsShort := (interpreterProxy slotSizeOf: _gsSqueakTemp_points)
				= (_gsSqueakTemp_nSegments * 3).
	"Then actually load the compressed shape"
	self
		loadCompressedShape: (interpreterProxy firstIndexableField: _gsSqueakTemp_points)
		segments: _gsSqueakTemp_nSegments
		leftFills: (interpreterProxy firstIndexableField: _gsSqueakTemp_leftFills)
		rightFills: (interpreterProxy firstIndexableField: _gsSqueakTemp_rightFills)
		lineWidths: (interpreterProxy firstIndexableField: _gsSqueakTemp_lineWidths)
		lineFills: (interpreterProxy firstIndexableField: _gsSqueakTemp_lineFills)
		fillIndexList: (interpreterProxy firstIndexableField: _gsSqueakTemp_fillIndexList)
		pointShort: _gsSqueakTemp_pointsShort.
	engineStopped
		ifTrue: [^ interpreterProxy primitiveFailFor: GEFEngineStopped].
	interpreterProxy failed
		ifTrue: [^ interpreterProxy primitiveFailFor: GEFEntityLoadFailed].
	self needsFlushPut: 1.
	self storeEngineStateInto: engine.
	interpreterProxy pop: 7