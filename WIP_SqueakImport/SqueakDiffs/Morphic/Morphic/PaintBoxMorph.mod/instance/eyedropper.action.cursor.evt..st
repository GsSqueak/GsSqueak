actions
eyedropper: aButton action: aSelector cursor: aCursor evt: evt 
	"Take total control and pick up a color!!"

	| pt feedbackColor delay |
	delay := Delay forMilliseconds: 10.
	aButton state: #on.
	tool ifNotNil: [tool state: #off].
	currentCursor := aCursor.
	evt hand showTemporaryCursor: currentCursor
		hotSpotOffset: 6 negated @ 4 negated.
	"<<<< the form was changed a bit??"
	feedbackColor := Display colorAt: Sensor cursorPoint.
	colorMemory align: colorMemory bounds topRight
		with: colorMemoryThin bounds topRight.
	self addMorphFront: colorMemory.

	"Full color picker"
	[Sensor anyButtonPressed] whileFalse: 
			[pt := Sensor cursorPoint.
			"deal with the fact that 32 bit displays may have garbage in the 
			alpha bits"
			feedbackColor := Display depth = 32 
						ifTrue: 
							[Color colorFromPixelValue: ((Display pixelValueAt: pt) bitOr: 16rFF000000)
								depth: 32]
						ifFalse: [Display colorAt: pt].
			"the hand needs to be drawn"
			evt hand position: pt.
			currentColor ~= feedbackColor ifTrue: [
				currentColor := feedbackColor.
				self showColor ].
			self refreshWorld.
			delay wait].

	"Now wait for the button to be released."
	[Sensor anyButtonPressed] whileTrue:
		[ pt := Sensor cursorPoint.
		"the hand needs to be drawn"
		evt hand position: pt.
		self refreshWorld.
		delay wait].

	evt hand showTemporaryCursor: nil hotSpotOffset: 0 @ 0.
	self currentColor: feedbackColor evt: evt.
	colorMemory delete.
	tool ifNotNil: 
			[tool state: #on.
			currentCursor := tool arguments third].
	aButton state: #off
