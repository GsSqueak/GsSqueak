event handling
mouseMove: evt
	"The mouse moved while the butten was down in the receiver"

	| aForm |
	aForm := self imageForm.
	(self containsPoint: evt cursorPoint)
		ifTrue:
			[aForm reverse displayOn: Display]
		ifFalse:
			[aForm displayOn: Display]