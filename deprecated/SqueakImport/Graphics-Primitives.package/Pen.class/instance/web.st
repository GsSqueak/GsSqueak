geometric designs
web   "Display restoreAfter: [Pen new web]"
	"Draw pretty web-like patterns from the mouse movement on the screen.
	Press the mouse button to draw, option-click to exit.
	By Dan Ingalls and Mark Lentczner. "
	| history newPoint ancientPoint lastPoint filter color |
	"self erase."
	color := 1.
	[ history := OrderedCollection new.
	Sensor waitButton.
	Sensor yellowButtonPressed ifTrue: [^ self].
	filter := lastPoint := Sensor cursorPoint.
	20 timesRepeat: [ history addLast: lastPoint ].
	self color: (color := color + 1).
	[ Sensor redButtonPressed ] whileTrue: 
		[ newPoint := Sensor cursorPoint.
		(newPoint = lastPoint) ifFalse:
			[ ancientPoint := history removeFirst.
			filter := filter * 4 + newPoint // 5.
			self place: filter.
			self goto: ancientPoint.
			lastPoint := newPoint.
			history addLast: filter ] ] ] repeat