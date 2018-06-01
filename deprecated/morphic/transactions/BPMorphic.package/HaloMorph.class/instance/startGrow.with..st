private
startGrow: evt with: growHandle 
	"Initialize resizing of my target. Launch a command representing it, to
	support Undo"
	| _gsSqueakTemp_botRt |
	self obtainHaloForEvent: evt andRemoveAllHandlesBut: growHandle.
	_gsSqueakTemp_botRt := target point: target bottomRight in: owner.
	positionOffset := (self world viewBox containsPoint: _gsSqueakTemp_botRt)
				ifTrue: [evt cursorPoint - _gsSqueakTemp_botRt]
				ifFalse: [0 @ 0].
	self setProperty: #commandInProgress toValue: (Command new cmdWording: 'resize ' translated , target nameForUndoWording;
			
			undoTarget: target renderedMorph
			selector: #setFlexExtentFromHalo:
			argument: target extent).
	originalExtent := target extent