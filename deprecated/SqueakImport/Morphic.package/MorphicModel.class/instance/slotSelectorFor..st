compilation
slotSelectorFor: selectorBody
	| selector |
	model ifNil: [^ nil].
	"Make up selector from slotname if any"
	selector := (slotName ifNil: [selectorBody]
					ifNotNil: [slotName , selectorBody]) asSymbol.
	(model canUnderstand: selector) ifFalse:
		[self halt: 'Compiling a null response for ' , model class name , '>>' , selector].
	^ selector