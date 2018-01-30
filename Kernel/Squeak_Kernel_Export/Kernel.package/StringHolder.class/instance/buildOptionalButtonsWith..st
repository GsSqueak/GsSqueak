toolbuilder
buildOptionalButtonsWith: builder

	| panelSpec |
	panelSpec := builder pluggablePanelSpec new.
	panelSpec children: OrderedCollection new.
	self optionalButtonPairs do:[:spec|
		| buttonSpec |
		buttonSpec := builder pluggableActionButtonSpec new.
		buttonSpec model: self.
		buttonSpec label: spec first.
		buttonSpec action: spec second.
		spec size > 2 ifTrue:[buttonSpec help: spec third].
		panelSpec children add: buttonSpec.
	].
	panelSpec layout: #horizontal. "buttons"
	^panelSpec