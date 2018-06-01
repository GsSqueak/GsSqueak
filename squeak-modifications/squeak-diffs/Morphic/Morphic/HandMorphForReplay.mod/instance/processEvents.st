event handling
processEvents
	"Play back the next event"

	| evt hadMouse hadAny tracker  |
	suspended == true ifTrue: [^ self].
	hadMouse := hadAny := false.
	tracker := recorder objectTrackingEvents.
	[(evt := recorder nextEventToPlay) isNil] whileFalse: 
			[
			((evt isMemberOf: MouseMoveEvent) and: [evt trail isNil]) ifTrue: [^ self].
			tracker ifNotNil: [tracker currentEventTimeStamp: evt timeStamp].
			evt type == #EOF 
				ifTrue: 
					[recorder pauseIn: ActiveWorld.
					^ self].
			evt type == #startSound 
				ifTrue: 
					[recorder perhapsPlaySound: evt argument.
					recorder synchronize.
					^ self].
			evt type == #startEventPlayback 
				ifTrue: 
					[evt argument launchPlayback.
					recorder synchronize.
					^ self].

			evt type == #noteTheatreBounds 
				ifTrue: 
					["The argument holds the content rect --for now we don't make any use of that info in this form."
					^ self].

			evt isMouse ifTrue: [hadMouse := true].
			(evt isMouse or: [evt isKeyboard]) 
				ifTrue: 
					[self handleEvent: (evt setHand: self) resetHandlerFields.
					hadAny := true]].
	(mouseClickState notNil and: [hadMouse not]) 
		ifTrue: 
			["No mouse events during this cycle. Make sure click states time out accordingly"

			mouseClickState handleEvent: lastMouseEvent asMouseMove from: self].
	hadAny 
		ifFalse: 
			["No pending events. Make sure z-order is up to date"

			self mouseOverHandler processMouseOver: lastMouseEvent]