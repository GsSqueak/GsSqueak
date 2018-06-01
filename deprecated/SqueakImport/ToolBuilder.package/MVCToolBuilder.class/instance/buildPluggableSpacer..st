widgets required
buildPluggableSpacer: aSpec
	
	| widget |
	widget := View new.
	self register: widget id: aSpec name.

	widget borderWidth: 0.
	widget backgroundColor: nil.
	widget foregroundColor: nil.
	widget window: (widget window topLeft extent: aSpec extent).
	
	self setFrame: aSpec frame in: widget.

	parent ifNotNil:[parent addSubView: widget].
	^widget