toolbuilder
buildControlButtonsWith: builder

	| panelSpec |
	panelSpec := builder pluggablePanelSpec new.
	panelSpec children: OrderedCollection new.
	self customButtonSpecs do:[:spec|
		| buttonSpec |
		buttonSpec := builder pluggableActionButtonSpec new.
		buttonSpec model: self.
		buttonSpec label: spec first.
		buttonSpec action: spec second.
		spec second == #methodHierarchy ifTrue:[
			buttonSpec color: #inheritanceButtonColor.
		]. 
		spec size > 2 ifTrue:
			[buttonSpec help: spec third.
			 spec size > 3 ifTrue:
				[buttonSpec enabled: spec fourth]].
		panelSpec children add: buttonSpec.
	].

	panelSpec layout: #horizontal. "buttons"
	^panelSpec