recent colors
mouseStillDownRecent: evt with: aMorph
	(aMorph containsPoint: evt cursorPoint)
		ifTrue:[aMorph borderColor: Color white]
		ifFalse:[aMorph borderColor: (Color r: 0.194 g: 0.258 b: 0.194)]
