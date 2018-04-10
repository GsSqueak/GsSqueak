compilation
slotSelectorFor: selectorBody 
	| _gsSqueakTemp_selector |
	model
		ifNil: [^ nil].
	"Make up selector from slotname if any"
	_gsSqueakTemp_selector := (slotName
				ifNil: [selectorBody]
				ifNotNil: [slotName , selectorBody]) asSymbol.
	(model canUnderstand: _gsSqueakTemp_selector)
		ifFalse: [self halt: 'Compiling a null response for ' , model class name , '>>' , _gsSqueakTemp_selector].
	^ _gsSqueakTemp_selector