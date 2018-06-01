toolbuilder
buildWindowWith: builder 
	| _gsSqueakTemp_windowSpec |
	_gsSqueakTemp_windowSpec := builder pluggableWindowSpec new.
	_gsSqueakTemp_windowSpec model: self.
	_gsSqueakTemp_windowSpec label: #labelString.
	_gsSqueakTemp_windowSpec children: OrderedCollection new.
	^ _gsSqueakTemp_windowSpec