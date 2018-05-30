widgets optional
buildPluggableCheckBox: spec

	| widget label state action |
	label := spec label.
	state := spec state.
	action := spec action.
	widget := self checkBoxClass on: spec model
				getState: (state isSymbol ifTrue:[state])
				action: (action isSymbol ifTrue:[action])
				label: (label isSymbol ifTrue:[label]).
	self register: widget id: spec name.

	widget installButton.
"	widget getColorSelector: spec color.
	widget offColor: Color white..
	self buildHelpFor: widget spec: spec. 
	(label isSymbol or:[label == nil]) ifFalse:[widget label: label].
"	self setFrame: spec frame in: widget.
	self setLayoutHintsFor: widget spec: spec.
	parent ifNotNil:[self add: widget to: parent].
	^widget