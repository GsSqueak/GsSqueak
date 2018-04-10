editing keys
setEmphasis: emphasisSymbol 
	"Change the emphasis of the current selection."
	| _gsSqueakTemp_oldAttributes _gsSqueakTemp_attribute |
	_gsSqueakTemp_oldAttributes := paragraph text attributesAt: self selectionInterval first.
	_gsSqueakTemp_attribute := TextEmphasis perform: emphasisSymbol.
	emphasisSymbol == #normal
		ifFalse: [_gsSqueakTemp_oldAttributes
				do: [:att | (att dominates: _gsSqueakTemp_attribute)
						ifTrue: [_gsSqueakTemp_attribute turnOff]]].
	self
		replaceSelectionWith: (self selection addAttribute: _gsSqueakTemp_attribute)