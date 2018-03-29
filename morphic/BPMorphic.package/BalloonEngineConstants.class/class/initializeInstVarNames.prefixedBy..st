pool definition
initializeInstVarNames: aClass prefixedBy: aString 
	| _gsSqueakTemp_token |
	aClass instVarNames
		doWithIndex: [:instVarName :index | 
			| value |
			_gsSqueakTemp_token := (aString , instVarName first asUppercase asString
						, (instVarName copyFrom: 2 to: instVarName size) , 'Index') asSymbol.
			value := index - 1.
			(self bindingOf: _gsSqueakTemp_token)
				ifNil: [self addClassVarName: _gsSqueakTemp_token].
			(self bindingOf: _gsSqueakTemp_token)
				value: value].
	_gsSqueakTemp_token := (aString , aClass name , 'Size') asSymbol.
	(self bindingOf: _gsSqueakTemp_token)
		ifNil: [self addClassVarName: _gsSqueakTemp_token].
	(self bindingOf: _gsSqueakTemp_token)
		value: aClass instSize