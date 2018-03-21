toolbuilder
buildOptionalButtonsWith: builder 
	| _gsSqueakTemp_panelSpec |
	_gsSqueakTemp_panelSpec := builder pluggablePanelSpec new.
	_gsSqueakTemp_panelSpec children: OrderedCollection new.
	self optionalButtonPairs
		do: [:spec | 
			| buttonSpec |
			buttonSpec := builder pluggableActionButtonSpec new.
			buttonSpec model: self.
			buttonSpec label: spec first.
			buttonSpec action: spec second.
			spec size > 2
				ifTrue: [buttonSpec help: spec third].
			_gsSqueakTemp_panelSpec children add: buttonSpec].
	_gsSqueakTemp_panelSpec layout: #horizontal.
	"buttons"
	^ _gsSqueakTemp_panelSpec