drawing
drawOverlayOn: aCanvas

	| title inset |
	super drawOverlayOn: aCanvas.

	title := self submorphs first.

	self wantsRoundedCorners ifTrue: [
		inset := (self class roundedDialogCorners and: [self class gradientDialog])
			"This check compensates a bug in balloon."
			ifTrue: [0@0 corner: 0@ -1] ifFalse: [self borderWidth @ 0].

		"Overdraw lower part of title bar to hide bottom corners."		
		aCanvas
			fillRectangle:( (title bottomLeft - (0 @ self submorphs first cornerRadius) corner: title bottomRight) insetBy: inset)
			color: self color].
		
	"Draw a line between the title and the contents."
	self borderWidth > 0 ifTrue: [			
		"Redraw the border all around. Needed because rounded borders do not align very well."
		self wantsRoundedCorners
			ifTrue: [	aCanvas frameRoundRect: self bounds radius: self cornerRadius width: self borderStyle width color: self borderStyle color]
			ifFalse: [aCanvas frameRectangle: self bounds width: self borderStyle width color: self borderStyle color]].