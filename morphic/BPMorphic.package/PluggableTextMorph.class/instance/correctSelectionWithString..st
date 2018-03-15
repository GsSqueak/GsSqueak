interactive error protocol
correctSelectionWithString: aString 
	"I can't tell if this is a hack or if it's the right thing to do."
	| _gsSqueakTemp_result _gsSqueakTemp_newPosition |
	self setSelection: selectionInterval.
	_gsSqueakTemp_result := self
				correctFrom: selectionInterval first
				to: selectionInterval last
				with: aString.
	_gsSqueakTemp_newPosition := selectionInterval first + aString size.
	self
		setSelection: (_gsSqueakTemp_newPosition to: _gsSqueakTemp_newPosition - 1).
	^ _gsSqueakTemp_result