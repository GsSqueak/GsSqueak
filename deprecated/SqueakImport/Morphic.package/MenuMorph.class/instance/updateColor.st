control
updateColor
	| fill title cc |
	self class gradientMenu
		ifFalse: [^ self].
	(self fillStyle == self color) not 
		ifTrue: [^ self]. "Don't apply the gradient more than once"
	""
	title := self allMorphs
				detect: [:each | each hasProperty: #titleString]
				ifNone: [].
	
	cc := self color adjustSaturation: -0.08 brightness: 0.4.
	fill := GradientFillStyle ramp: {
		0.0 -> (title ifNil: [cc] ifNotNil: [cc muchLighter]). 
		0.25 -> (self color mixed: 0.5 with: cc). 
		1.0 -> self color}.
	""
	fill
		radial: false;
		origin: self topLeft;
		direction: 0 @ self height.
	""
	" 
	update the title color"

	title ifNotNil: [fill direction: 0@ title height].
	self fillStyle: fill.
	title ifNil: [^ self].
	""
	fill := GradientFillStyle ramp: {
			0.0 -> title color twiceLighter.
			1 -> title color twiceDarker}.
	""
	fill
		origin: title topLeft;
		direction: title width @ 0.
	""
	title fillStyle: fill