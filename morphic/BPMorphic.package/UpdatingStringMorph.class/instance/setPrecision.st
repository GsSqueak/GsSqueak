editing
setPrecision
	"Allow the user to specify a number of decimal places. This UI is
	invoked from a menu. Nowadays the precision can be set by simple
	type-in, making this menu approach mostly obsolete. However, it's
	still useful for read-only readouts, where type-in is not allowed."
	| _gsSqueakTemp_aMenu |
	_gsSqueakTemp_aMenu := MenuMorph new.
	_gsSqueakTemp_aMenu
		addTitle: ('How many decimal places? (currently {1})' translated format: {self decimalPlaces}).
	0
		to: 10
		do: [:places | _gsSqueakTemp_aMenu
				add: places asString
				target: self
				selector: #setDecimalPlaces:
				argument: places].
	_gsSqueakTemp_aMenu popUpInWorld