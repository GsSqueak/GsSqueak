private events
generateMouseEvent: evtBuf 
	"Generate the appropriate mouse event for the given raw event buffer"

	| position buttons modifiers type trail stamp oldButtons evtChanged |
	evtBuf first = lastEventBuffer first 
		ifTrue: 
			["Workaround for Mac VM bug, *always* generating 3 events on clicks"

			evtChanged := false.
			3 to: evtBuf size
				do: [:i | (lastEventBuffer at: i) = (evtBuf at: i) ifFalse: [evtChanged := true]].
			evtChanged ifFalse: [^nil]].
	stamp := evtBuf second.
	stamp = 0 ifTrue: [stamp := Time eventMillisecondClock].
	position := evtBuf third @ evtBuf fourth.
	buttons := evtBuf fifth.
	modifiers := evtBuf sixth.

	type := buttons = 0 
		ifTrue:[
				lastEventBuffer fifth = 0 		
					ifTrue: [#mouseMove] 	"this time no button and previously no button .. just mouse move"
					ifFalse: [#mouseUp]		"this time no button but previously some button ... therefore button was released"
		]
		ifFalse:[
				buttons = lastEventBuffer fifth
						ifTrue: [#mouseMove]		"button states are the same .. now and past .. therfore a mouse movement"
						ifFalse: [					"button states are different .. button was pressed or released"
							buttons > lastEventBuffer fifth
								ifTrue: [#mouseDown]
								ifFalse:[#mouseUp].
						].
		].
	buttons := buttons bitOr: (modifiers bitShift: 3).
	oldButtons := lastEventBuffer fifth 
				bitOr: (lastEventBuffer sixth bitShift: 3).
	lastEventBuffer := evtBuf.
	type == #mouseMove 
		ifTrue: 
			[trail := self mouseTrailFrom: evtBuf.
			^MouseMoveEvent new 
				setType: type
				startPoint: (self position)
				endPoint: trail last
				trail: trail
				buttons: buttons
				hand: self
				stamp: stamp].
	^MouseButtonEvent new 
		setType: type
		position: position
		which: (oldButtons bitXor: buttons)
		buttons: buttons
		nClicks: (evtBuf seventh ifNil: [0])
		hand: self
		stamp: stamp