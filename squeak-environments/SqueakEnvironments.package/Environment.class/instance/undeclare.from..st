declaring
undeclare: aSymbol from: aNamespace 
	| _gsSqueakTemp_binding |
	_gsSqueakTemp_binding := self undeclare: aSymbol.
	(aNamespace bindingOf: aSymbol)
		ifNotNil: [:old | 
			aNamespace removeKey: aSymbol.
			old becomeForward: _gsSqueakTemp_binding].
	^ _gsSqueakTemp_binding