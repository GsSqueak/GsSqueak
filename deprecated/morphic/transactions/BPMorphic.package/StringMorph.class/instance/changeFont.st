menu
changeFont
	| _gsSqueakTemp_chooser _gsSqueakTemp_originalFont |
	_gsSqueakTemp_originalFont := self fontToUse.
	self
		openModal: (Cursor wait
				showWhile: [| window |
					window := UIManager default
								chooseFont: 'Choose a Font'
								for: self
								setSelector: #font:
								getSelector: _gsSqueakTemp_originalFont.
					"We have to save the model here, because it will be
					gone when the window is closed."
					_gsSqueakTemp_chooser := window model.
					window]).
	_gsSqueakTemp_originalFont = self fontToUse
		ifFalse: ["Ensure that we restore the original font in case it was
			changed, but Cancel was clicked."
			self
				font: (_gsSqueakTemp_chooser result
						ifNil: [_gsSqueakTemp_originalFont])]