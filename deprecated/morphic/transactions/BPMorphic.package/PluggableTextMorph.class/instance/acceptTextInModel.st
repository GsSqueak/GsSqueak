menu commands
acceptTextInModel
	"Inform the model that the receiver's textMorph's text should be
	accepted. Answer true if the model accepted ok, false otherwise"
	| _gsSqueakTemp_textToAccept |
	_gsSqueakTemp_textToAccept := textMorph contents copy.
	^ setTextSelector isNil
		or: [setTextSelector numArgs = 2
				ifTrue: [model
						perform: setTextSelector
						with: _gsSqueakTemp_textToAccept
						with: self]
				ifFalse: [model perform: setTextSelector with: _gsSqueakTemp_textToAccept]]