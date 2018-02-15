private
startRot: evt with: rotHandle 
	"Initialize rotation of my target if it is rotatable. Launch a command
	object to represent the action"
	self obtainHaloForEvent: evt andRemoveAllHandlesBut: rotHandle.
	target isFlexMorph
		ifFalse: [target isInWorld
				ifFalse: [self setTarget: target player costume].
			target addFlexShellIfNecessary].
	growingOrRotating := true.
	self removeAllHandlesBut: rotHandle.
	"remove all other handles"
	angleOffset := evt cursorPoint
				- (target pointInWorld: target referencePosition).
	angleOffset := Point r: angleOffset r degrees: angleOffset degrees - target rotationDegrees.
	self setProperty: #commandInProgress toValue: (Command new cmdWording: 'rotate ' translated , target nameForUndoWording;
			
			undoTarget: target renderedMorph
			selector: #heading:
			argument: target rotationDegrees)