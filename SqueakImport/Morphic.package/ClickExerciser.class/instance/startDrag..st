event handling
startDrag: evt
	"We'll get a mouseDown first, some mouseMoves, and a mouseUp event last"
	| height width both  |
	"evt isMouseDown ifTrue:
		[self showBalloon: 'drag (mouse down)' hand: evt hand.
		self world displayWorld.
		(Delay forMilliseconds: 750) wait].
	evt isMouseUp ifTrue:
		[self showBalloon: 'drag (mouse up)' hand: evt hand].
	(evt isMouseUp or: [evt isMouseDown]) ifFalse:
		[self showBalloon: 'drag (mouse still down)' hand: evt hand].
	(self containsPoint: evt cursorPoint)
		ifFalse: [^ self]."
	self showBalloon: 'drag (mouse down)' hand: evt hand.

	width  := (self defaultSide max: self extent x) min: self alternateSide.
	height := (self defaultSide max: self extent y) min: self alternateSide.
	both  := self defaultSide + self alternateSide. 

self extent:	
 (((color = (self defaultColor)
		ifTrue:
			[ (both - height) @ width  ]
		ifFalse:
			[ height @ (both - width) ]) 
	max: self defaultSide asPoint) 
	min: self alternateSide asPoint )
	
	