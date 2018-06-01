widgets required
buildPluggablePanel: aSpec
	| widget children |
	widget := View new model: aSpec model.
	widget
		borderWidth: 1;
		backgroundColor: nil;
		foregroundColor: nil.
	
	self register: widget id: aSpec name.
	children := aSpec children.
	children isSymbol ifTrue:[
		"@@@@ FIXME: PluggablePanes need to remember their getChildrenSelector"
		"widget getChildrenSelector: children.
		widget update: children."
		children := #().
	].
	self setFrame: aSpec frame in: widget.
	self buildAll: children in: widget.
	parent ifNotNil:[parent addSubView: widget].
	self setLayout: aSpec layout in: widget.
	^widget