private
doScale: evt with: scaleHandle 
	"Update the scale of my target if it is scalable."
	| _gsSqueakTemp_newHandlePos _gsSqueakTemp_colorToUse |
	evt hand obtainHalo: self.
	_gsSqueakTemp_newHandlePos := evt cursorPoint - (scaleHandle extent // 2).
	target scaleToMatch: _gsSqueakTemp_newHandlePos.
	_gsSqueakTemp_colorToUse := target scale = 1.0
				ifTrue: [Color yellow]
				ifFalse: [Color orange].
	self setColor: _gsSqueakTemp_colorToUse toHandle: scaleHandle.
	scaleHandle
		submorphsDo: [:m | m color: _gsSqueakTemp_colorToUse makeForegroundColor].
	scaleHandle position: _gsSqueakTemp_newHandlePos.
	self layoutChanged.
	(self valueOfProperty: #commandInProgress)
		ifNotNil: [:cmd | "Update the final extent"
			cmd
				redoTarget: target renderedMorph
				selector: #setFlexExtentFromHalo:
				argument: target extent]