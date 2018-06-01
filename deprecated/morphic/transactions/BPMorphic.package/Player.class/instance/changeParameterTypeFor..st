costume
changeParameterTypeFor: aSelector 
	"Change the parameter type for the given selector. Not currently sent,
	since types are now set by direct manipulation in the Scriptor header.
	If this were reinstated someday, there would probably be an issue
	about getting correct-looking Parameter tile(s) into the Scriptor
	header(s) "
	| _gsSqueakTemp_current _gsSqueakTemp_typeChoices _gsSqueakTemp_typeChosen |
	_gsSqueakTemp_current := self typeforParameterFor: aSelector.
	_gsSqueakTemp_typeChoices := Vocabulary typeChoices.
	_gsSqueakTemp_typeChosen := UIManager default
				chooseFrom: _gsSqueakTemp_typeChoices
				values: _gsSqueakTemp_typeChoices
				title: 'Choose the TYPE
for the parameter (currently ' , _gsSqueakTemp_current , ')'.
	self setParameterFor: aSelector toType: _gsSqueakTemp_typeChosen