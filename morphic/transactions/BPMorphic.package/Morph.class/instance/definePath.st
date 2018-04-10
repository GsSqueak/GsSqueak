-Etoys-support
definePath
	| _gsSqueakTemp_points _gsSqueakTemp_lastPoint _gsSqueakTemp_aForm _gsSqueakTemp_offset _gsSqueakTemp_currentPoint _gsSqueakTemp_dwell _gsSqueakTemp_ownerPosition |
	_gsSqueakTemp_points := OrderedCollection new: 70.
	_gsSqueakTemp_lastPoint := nil.
	_gsSqueakTemp_aForm := self imageForm.
	_gsSqueakTemp_offset := _gsSqueakTemp_aForm extent // 2.
	_gsSqueakTemp_ownerPosition := owner position.
	Cursor move show.
	Sensor waitButton.
	[Sensor anyButtonPressed
		and: [_gsSqueakTemp_points size < 100]]
		whileTrue: [_gsSqueakTemp_currentPoint := Sensor cursorPoint.
			_gsSqueakTemp_dwell := 0.
			_gsSqueakTemp_currentPoint = _gsSqueakTemp_lastPoint
				ifTrue: [_gsSqueakTemp_dwell := _gsSqueakTemp_dwell + 1.
					_gsSqueakTemp_dwell \\ 1000 = 0
						ifTrue: [Beeper beep]]
				ifFalse: [self position: _gsSqueakTemp_currentPoint - _gsSqueakTemp_offset.
					self world displayWorld.
					(Delay forMilliseconds: 20) wait.
					_gsSqueakTemp_points add: _gsSqueakTemp_currentPoint.
					_gsSqueakTemp_lastPoint := _gsSqueakTemp_currentPoint]].
	_gsSqueakTemp_points size > 1
		ifTrue: [_gsSqueakTemp_points size = 100
				ifTrue: [self playSoundNamed: 'croak'].
			Transcript cr; show: 'path defined with
' , _gsSqueakTemp_points size printString , ' points'.
			self renderedMorph
				setProperty: #pathPoints
				toValue: (_gsSqueakTemp_points
						collect: [:p | p - _gsSqueakTemp_ownerPosition])]
		ifFalse: [self inform: 'no path obtained'].
	Cursor normal show