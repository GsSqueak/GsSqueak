start & finish
addRotationScaleHandles
	"Rotation and scaling handles"
	rotationButton := SketchMorph withForm: palette rotationTabForm.
	rotationButton position: bounds topCenter - (6 @ 0).
	rotationButton
		on: #mouseDown
		send: #rotateScalePrep:
		to: self.
	rotationButton
		on: #mouseMove
		send: #rotateBy:
		to: self.
	rotationButton
		on: #mouseUp
		send: #rotateDone:
		to: self.
	rotationButton
		on: #mouseEnter
		send: #mouseLeave:
		to: self.
	"Put cursor back"
	rotationButton
		on: #mouseLeave
		send: #mouseEnter:
		to: self.
	Preferences rotationAndScaleHandlesInPaintBox
		ifTrue: [self addMorph: rotationButton].
	rotationButton setBalloonText: 'Drag me sideways to
rotate your
picture.' translated.
	scaleButton := SketchMorph withForm: palette scaleTabForm.
	scaleButton position: bounds rightCenter - (scaleButton width @ 6).
	scaleButton
		on: #mouseDown
		send: #rotateScalePrep:
		to: self.
	scaleButton
		on: #mouseMove
		send: #scaleBy:
		to: self.
	scaleButton
		on: #mouseEnter
		send: #mouseLeave:
		to: self.
	"Put cursor back"
	scaleButton
		on: #mouseLeave
		send: #mouseEnter:
		to: self.
	Preferences rotationAndScaleHandlesInPaintBox
		ifTrue: [self addMorph: scaleButton].
	scaleButton setBalloonText: 'Drag me up and down to change
the size
of your picture.' translated.
	"REMOVED:
	fwdButton := PolygonMorph new.
	pt := bounds topCenter.
	fwdButton borderWidth: 2; makeOpen; makeBackArrow; borderColor:
	(Color r: 0 g: 0.8 b: 0).
	fwdButton removeHandles; setVertices: (Array with: pt+(0@7) with:
	pt+(0@22)).
	fwdButton on: #mouseMove send: #forward:direction: to: self.
	fwdButton on: #mouseEnter send: #mouseLeave: to: self.	
	fwdButton on: #mouseLeave send: #mouseEnter: to: self.
	self setProperty: #fwdButton toValue: fwdButton.
	self addMorph: fwdButton.
	fwdButton setBalloonText: 'Drag me around to point
	in the direction
	I go forward.' translated.
	
	toggle := EllipseMorph
	newBounds: (Rectangle center: fwdButton vertices last +
	(-4@4) extent: 8@8)
	color: Color gray.
	toggle on: #mouseUp send: #toggleDirType:in: to: self.
	toggle on: #mouseEnter send: #mouseLeave: to: self.
	toggle on: #mouseLeave send: #mouseEnter: to: self.
	self setProperty: #fwdToggle toValue: toggle.
	fwdButton addMorph: toggle.
	toggle setBalloonText: 'When your object turns,
	how should its
	picture change?
	It can rotate, face left or right,
	face up or down, or not
	change.' translated.
	"
	self setProperty: #rotationStyle toValue: hostView rotationStyle