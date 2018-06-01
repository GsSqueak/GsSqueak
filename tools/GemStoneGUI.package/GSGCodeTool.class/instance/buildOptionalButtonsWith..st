toolbuilder
buildOptionalButtonsWith: builder

	| panelSpec |
	panelSpec := builder pluggablePanelSpec new.
	panelSpec children: OrderedCollection new.
	self optionalButtonSpecs do:[:spec|
		| buttonSpec |
		buttonSpec := builder pluggableActionButtonSpec new.
		buttonSpec model: self.
		buttonSpec label: spec first.
		buttonSpec action: spec second.
		spec second == #browseMethodHierarchy
			ifTrue:[buttonSpec
				enabled: #inheritanceButtonEnabled;
				color: #inheritanceButtonColor].
		spec second == #browseVersions
			ifTrue:[buttonSpec enabled: #versionsButtonEnabled].
		buttonSpec help: spec third.
		panelSpec children add: buttonSpec].

	panelSpec layout: #horizontal. "buttons"
	^ panelSpec