binding
showBinding: aBinding 
	| _gsSqueakTemp_binding |
	_gsSqueakTemp_binding := undeclared
				associationAt: aBinding key
				ifAbsent: [].
	_gsSqueakTemp_binding
		ifNotNil: [undeclared removeKey: _gsSqueakTemp_binding key.
			_gsSqueakTemp_binding becomeForward: aBinding].
	_gsSqueakTemp_binding := bindings
				associationAt: aBinding key
				ifAbsent: [].
	_gsSqueakTemp_binding
		ifNotNil: [_gsSqueakTemp_binding == aBinding
				ifTrue: [^ self].
			bindings removeKey: _gsSqueakTemp_binding key].
	bindings add: aBinding