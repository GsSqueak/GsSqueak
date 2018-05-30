widgets required
buildPluggableButton: aSpec
	| widget label state action enabled |
	label := aSpec label.
	state := aSpec state.
	action := aSpec action.
	widget := self buttonClass on: aSpec model
				getState: (state isSymbol ifTrue:[state])
				action: nil
				label: (label isSymbol ifTrue:[label]).
	widget style: aSpec style.
	aSpec changeLabelWhen
		ifNotNil: [ :event | widget whenChanged: event update: aSpec label].
	self register: widget id: aSpec name.
	enabled := aSpec enabled.
	enabled isSymbol
		ifTrue:[widget getEnabledSelector: enabled]
		ifFalse:[widget enabled:enabled].
	widget action: action.
	aSpec color isColor
		ifTrue: [widget offColor: aSpec color]
		ifFalse: [widget getColorSelector: aSpec color].
	self buildHelpFor: widget spec: aSpec. 
	(label isSymbol or:[label == nil]) ifFalse:[widget label: label].
	self setFrame: aSpec frame in: widget.
	self setLayoutHintsFor: widget spec: aSpec.
	parent ifNotNil:[self add: widget to: parent].
	^widget