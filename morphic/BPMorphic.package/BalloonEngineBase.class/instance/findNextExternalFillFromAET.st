AET processing
findNextExternalFillFromAET
	"Scan the active edge table. If there is any fill that cannot be handled
	by the engine itself, return true. Otherwise handle the fills and return
	false. "
	"self currentYGet >= 680 ifTrue:[
	self printAET.
	self halt.
	]."
	| _gsSqueakTemp_leftEdge _gsSqueakTemp_rightEdge _gsSqueakTemp_leftX _gsSqueakTemp_rightX |
	_gsSqueakTemp_leftX := _gsSqueakTemp_rightX := self fillMaxXGet.
	[self aetStartGet < self aetUsedGet]
		whileTrue: [_gsSqueakTemp_leftEdge := _gsSqueakTemp_rightEdge := aetBuffer at: self aetStartGet.
			"TODO: We should check if leftX from last operation 
			is greater than leftX from next edge.
			Currently, we rely here on spanEndAA
			from the span buffer fill."
			_gsSqueakTemp_leftX := _gsSqueakTemp_rightX := self edgeXValueOf: _gsSqueakTemp_leftEdge.
			_gsSqueakTemp_leftX >= self fillMaxXGet
				ifTrue: [^ false].
			"Nothing more visible"
			self quickRemoveInvalidFillsAt: _gsSqueakTemp_leftX.
			"Check if we need to draw the edge"
			(self isWide: _gsSqueakTemp_leftEdge)
				ifTrue: [self toggleWideFillOf: _gsSqueakTemp_leftEdge].
			(self areEdgeFillsValid: _gsSqueakTemp_leftEdge)
				ifTrue: [self toggleFillsOf: _gsSqueakTemp_leftEdge.
					"Adjust the fills"
					engineStopped
						ifTrue: [^ false]].
			self aetStartPut: self aetStartGet + 1.
			self aetStartGet < self aetUsedGet
				ifTrue: [_gsSqueakTemp_rightEdge := aetBuffer at: self aetStartGet.
					_gsSqueakTemp_rightX := self edgeXValueOf: _gsSqueakTemp_rightEdge.
					_gsSqueakTemp_rightX >= self fillMinXGet
						ifTrue: ["This is the visible portion"
							self fillAllFrom: _gsSqueakTemp_leftX to: _gsSqueakTemp_rightX]]].
	"Note: Due to pre-clipping we may have to draw remaining stuff with
	the last fill"
	_gsSqueakTemp_rightX < self fillMaxXGet
		ifTrue: [self fillAllFrom: _gsSqueakTemp_rightX to: self fillMaxXGet].
	^ false