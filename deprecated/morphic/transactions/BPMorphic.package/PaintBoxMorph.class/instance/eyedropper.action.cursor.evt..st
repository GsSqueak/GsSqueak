actions
eyedropper: aButton action: aSelector cursor: aCursor evt: evt 
	"Take total control and pick up a color!!"
	| _gsSqueakTemp_pt _gsSqueakTemp_feedbackColor _gsSqueakTemp_delay |
	_gsSqueakTemp_delay := Delay forMilliseconds: 10.
	aButton state: #on.
	tool
		ifNotNil: [tool state: #off].
	currentCursor := aCursor.
	evt hand showTemporaryCursor: currentCursor hotSpotOffset: 6 negated @ 4 negated.
	"<<<< the form was changed a bit??"
	_gsSqueakTemp_feedbackColor := Display colorAt: Sensor cursorPoint.
	colorMemory align: colorMemory bounds topRight with: colorMemoryThin bounds topRight.
	self addMorphFront: colorMemory.
	"Full color picker"
	[Sensor anyButtonPressed]
		whileFalse: [_gsSqueakTemp_pt := Sensor cursorPoint.
			"deal with the fact that 32 bit displays may have garbage in
			the 
			alpha bits"
			_gsSqueakTemp_feedbackColor := Display depth = 32
						ifTrue: [Color
								colorFromPixelValue: ((Display pixelValueAt: _gsSqueakTemp_pt)
										bitOr: 4278190080)
								depth: 32]
						ifFalse: [Display colorAt: _gsSqueakTemp_pt].
			"the hand needs to be drawn"
			evt hand position: _gsSqueakTemp_pt.
			currentColor ~= _gsSqueakTemp_feedbackColor
				ifTrue: [currentColor := _gsSqueakTemp_feedbackColor.
					self showColor].
			self refreshWorld.
			_gsSqueakTemp_delay wait].
	"Now wait for the button to be released."
	[Sensor anyButtonPressed]
		whileTrue: [_gsSqueakTemp_pt := Sensor cursorPoint.
			"the hand needs to be drawn"
			evt hand position: _gsSqueakTemp_pt.
			self refreshWorld.
			_gsSqueakTemp_delay wait].
	evt hand showTemporaryCursor: nil hotSpotOffset: 0 @ 0.
	self currentColor: _gsSqueakTemp_feedbackColor evt: evt.
	colorMemory delete.
	tool
		ifNotNil: [tool state: #on.
			currentCursor := tool arguments third].
	aButton state: #off