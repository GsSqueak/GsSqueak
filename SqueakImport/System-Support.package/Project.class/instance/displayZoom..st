displaying
displayZoom: entering
	"Show the project transition when entering a new project"
	| newDisplay vanishingPoint |
	"Play the flash transition if any."
	self projectParameters at: #flashTransition ifPresent:[:dict|
		dict at: CurrentProject ifPresent:[:player| ^player playProjectTransitionFrom: CurrentProject to: self entering: entering]].
	"Show animated zoom to new display"
	newDisplay := self imageForm.
	entering
		ifTrue: [vanishingPoint := Sensor cursorPoint]
		ifFalse: [vanishingPoint := self viewLocFor: CurrentProject].
	Display zoomIn: entering orOutTo: newDisplay at: 0@0
			vanishingPoint: vanishingPoint.