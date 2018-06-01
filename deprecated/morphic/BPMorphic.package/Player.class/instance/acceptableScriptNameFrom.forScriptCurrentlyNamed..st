scripts-kernel
acceptableScriptNameFrom: originalString forScriptCurrentlyNamed: currentName 
	"Produce an acceptable script name, derived from the current name,
	for the receiver. This method will always return a valid script name
	that will be suitable for use in the given situation, though you might
	not like its beauty sometimes."
	| _gsSqueakTemp_aString _gsSqueakTemp_stemAndSuffix _gsSqueakTemp_proscribed _gsSqueakTemp_stem _gsSqueakTemp_suffix _gsSqueakTemp_withoutColon _gsSqueakTemp_currentNumArgs _gsSqueakTemp_withColon |
	_gsSqueakTemp_withoutColon := originalString copyWithoutAll: {$:. Character space}.
	(currentName notNil
			and: [(currentName copyWithout: $:)
					= _gsSqueakTemp_withoutColon])
		ifTrue: [^ currentName].
	"viz. no change; otherwise, the #respondsTo: check gets in the way"
	_gsSqueakTemp_currentNumArgs := currentName
				ifNil: [0]
				ifNotNil: [currentName numArgs].
	_gsSqueakTemp_aString := _gsSqueakTemp_withoutColon asIdentifier: false.
	"get an identifier starting with a lowercase letter"
	_gsSqueakTemp_stemAndSuffix := _gsSqueakTemp_aString stemAndNumericSuffix.
	_gsSqueakTemp_proscribed := #(#self #super #thisContext #costume #costumes #dependents #true #false #size ).
	_gsSqueakTemp_stem := _gsSqueakTemp_stemAndSuffix first.
	_gsSqueakTemp_suffix := _gsSqueakTemp_stemAndSuffix last.
	_gsSqueakTemp_withoutColon := _gsSqueakTemp_aString asSymbol.
	_gsSqueakTemp_withColon := (_gsSqueakTemp_withoutColon , ':') asSymbol.
	[(_gsSqueakTemp_proscribed includes: _gsSqueakTemp_withoutColon)
		or: [(self respondsTo: _gsSqueakTemp_withoutColon)
				or: [(self respondsTo: _gsSqueakTemp_withColon)
						or: [(Smalltalk includesKey: _gsSqueakTemp_withoutColon)
								or: [Smalltalk includesKey: _gsSqueakTemp_withColon]]]]]
		whileTrue: [_gsSqueakTemp_suffix := _gsSqueakTemp_suffix + 1.
			_gsSqueakTemp_withoutColon := (_gsSqueakTemp_stem , _gsSqueakTemp_suffix printString) asSymbol.
			_gsSqueakTemp_withColon := (_gsSqueakTemp_withoutColon , ':') asSymbol].
	^ _gsSqueakTemp_currentNumArgs = 0
		ifTrue: [_gsSqueakTemp_withoutColon]
		ifFalse: [_gsSqueakTemp_withColon]