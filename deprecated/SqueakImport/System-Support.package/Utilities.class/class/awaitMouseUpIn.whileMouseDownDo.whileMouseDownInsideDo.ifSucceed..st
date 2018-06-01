miscellaneous
awaitMouseUpIn: box whileMouseDownDo: doBlock1 whileMouseDownInsideDo: doBlock2 ifSucceed: succBlock
	"The mouse has gone down in box; track the mouse, inverting the box while it's within, and if, on mouse up, the cursor was still within the box, execute succBlock.  While waiting for the mouse to come up, repeatedly execute doBlock1, and also, if the cursor is within the box, execute doBlock2.  6/10/96 sw
3/31/00 JMM added logic to stop multiple redraws"

	| p inside lightForm darkForm isLight |

	p := Sensor cursorPoint.
	inside := box insetBy: 1.
	isLight := true.
	lightForm := Form fromDisplay: inside.
	darkForm := lightForm deepCopy reverse.
	[Sensor anyButtonPressed] whileTrue:
		[doBlock1 value.
		(box containsPoint: (p := Sensor cursorPoint))
			ifTrue: [doBlock2 value.
					isLight ifTrue: 
						[isLight := false.
						darkForm displayAt: inside origin]]
			ifFalse: [isLight ifFalse:
						[isLight := true.
						lightForm displayAt: inside origin]]].
	(box containsPoint: p)
		ifTrue: [lightForm displayAt: inside origin.
				^ succBlock value]
