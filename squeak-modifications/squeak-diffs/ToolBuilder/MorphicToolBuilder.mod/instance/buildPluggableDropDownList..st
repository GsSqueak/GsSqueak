widgets optional
buildPluggableDropDownList: spec

	| widget model listSelector selectionSelector selectionSetter |
	model := spec model.
	listSelector := spec listSelector.
	selectionSelector := spec selectionSelector.
	selectionSetter := spec selectionSetter.
	widget := self dropDownListClass new
		model: model;
		listSelector: listSelector;
		selectionSelector: selectionSelector;
		selectionSetter: selectionSetter;
		yourself.
	self register: widget id: spec name.

	widget installDropDownList.
	self setFrame: spec frame in: widget.
	self setLayoutHintsFor: widget spec: spec.
	parent ifNotNil:[self add: widget to: parent].
	^widget