-Etoys-universal slots & scripts
acceptableSlotNameFrom: originalString forSlotCurrentlyNamed: currentName asSlotNameIn: aPlayer world: aWorld 
	"Produce an acceptable slot name, derived from the current name, for
	aPlayer. This method will always return a valid slot name that will be
	suitable for use in the given situation, though you might not like its
	beauty sometimes."
	| _gsSqueakTemp_aString _gsSqueakTemp_stemAndSuffix _gsSqueakTemp_proscribed _gsSqueakTemp_stem _gsSqueakTemp_suffix _gsSqueakTemp_putative |
	_gsSqueakTemp_aString := originalString asIdentifier: false.
	"get an identifier not lowercase"
	_gsSqueakTemp_stemAndSuffix := _gsSqueakTemp_aString stemAndNumericSuffix.
	_gsSqueakTemp_proscribed := #(#self #super #thisContext #costume #costumes #dependents #true #false #size ) , aPlayer class allInstVarNames.
	_gsSqueakTemp_stem := _gsSqueakTemp_stemAndSuffix first.
	_gsSqueakTemp_suffix := _gsSqueakTemp_stemAndSuffix last.
	_gsSqueakTemp_putative := _gsSqueakTemp_aString asSymbol.
	[_gsSqueakTemp_putative ~~ currentName
		and: [(_gsSqueakTemp_proscribed includes: _gsSqueakTemp_putative)
				or: [(aPlayer respondsTo: _gsSqueakTemp_putative)
						or: [Smalltalk includesKey: _gsSqueakTemp_putative]]]]
		whileTrue: [_gsSqueakTemp_suffix := _gsSqueakTemp_suffix + 1.
			_gsSqueakTemp_putative := (_gsSqueakTemp_stem , _gsSqueakTemp_suffix printString) asSymbol].
	^ _gsSqueakTemp_putative