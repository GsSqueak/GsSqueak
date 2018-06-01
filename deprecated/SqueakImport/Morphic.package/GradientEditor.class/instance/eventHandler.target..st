event handling
eventHandler: anInstance target: aTarget 
	(anInstance isKindOf: SketchMorph)
		ifTrue: [anInstance
				on: #mouseUp
				send: #changeColor:event:target:
				to: self
				withValue: aTarget]
		ifFalse: [anInstance
				on: #mouseDown
				send: #limitHandleMove:event:from:
				to: self
				withValue: aTarget.
			anInstance
				on: #mouseMove
				send: #limitHandleMove:event:from:
				to: self
				withValue: aTarget]